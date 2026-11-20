local function aimlockAlpha(smoothing, dt)
    -- A larger smoothing value gives a longer response time, independent of FPS.
    return 1 - math.exp(-60 * math.clamp(dt, 0, 0.1) / smoothing)
end

local function validateVisualAimConfig(saved)
    assert(type(saved) == "table", "ESP/aimlock settings are missing.")
    local normalized = {}
    for _, key in { "esp", "tracers", "boxes", "fill", "chams", "espTeamCheck",
        "aimlock", "holdRightMouse", "aimTeamCheck", "wallCheck" } do
        assert(type(saved[key]) == "boolean", "Invalid ESP/aimlock setting: " .. key)
        normalized[key] = saved[key]
    end
    for key, bounds in { smoothing = { 1, 100 }, radius = { 20, 800 }, opacity = { 0, 100 } } do
        local value = saved[key]
        assert(type(value) == "number" and value == value and value >= bounds[1]
            and value <= bounds[2], "Invalid ESP/aimlock setting: " .. key)
        normalized[key] = value
    end
    assert(saved.part == "Head" or saved.part == "Body", "Invalid aimlock target part.")
    normalized.part = saved.part
    return normalized
end

local function installVisualAim(window, Rayfield, player)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Input = game:GetService("UserInputService")
    local state = { esp = false, tracers = false, boxes = true, fill = false, chams = true,
        espTeamCheck = false, aimlock = false, holdRightMouse = false, aimTeamCheck = false,
        wallCheck = true, smoothing = 10, radius = 300, opacity = 25, part = "Head" }
    local widgets, actors, connections = {}, {}, {}
    local alive, lockedPlayer, lastError = true, nil, nil
    local binding = "SandboxVisualAim_" .. game:GetService("HttpService"):GenerateGUID(false)
    local gui = Instance.new("ScreenGui")
    gui.Name = "SandboxESP"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 80
    gui.Parent = player:WaitForChild("PlayerGui")
    local tint = Color3.fromRGB(90, 200, 255)
    local tab = window:CreateTab("ESP", 4483362458)
    local aimTab = window:CreateTab("Aimlock", 4483362458)
    local status = aimTab:CreateLabel("Enable aimlock to track players. Higher smoothing = slower tracking.")
    local function toggle(where, name, key)
        widgets[key] = where:CreateToggle({ Name = name, CurrentValue = state[key], Flag = "VA_" .. key,
            Callback = function(value)
                state[key] = value
                if key == "aimlock" then lockedPlayer = nil end
            end })
    end
    toggle(tab, "Enable ESP", "esp")
    toggle(tab, "Tracers", "tracers")
    toggle(tab, "Boxes", "boxes")
    toggle(tab, "Box fill", "fill")
    toggle(tab, "Chams (through walls)", "chams")
    toggle(tab, "Ignore teammates", "espTeamCheck")
    widgets.opacity = tab:CreateSlider({ Name = "Fill / chams opacity", Range = { 0, 100 }, Increment = 1,
        Suffix = "%", CurrentValue = state.opacity, Flag = "VA_opacity",
        Callback = function(value) state.opacity = value end })
    toggle(aimTab, "Enable aimlock", "aimlock")
    toggle(aimTab, "Only while holding right mouse", "holdRightMouse")
    toggle(aimTab, "Ignore teammates", "aimTeamCheck")
    toggle(aimTab, "Check line of sight", "wallCheck")
    widgets.smoothing = aimTab:CreateSlider({ Name = "Smoothing (higher = slower)", Range = { 1, 100 },
        Increment = 1, CurrentValue = state.smoothing, Flag = "VA_smoothing",
        Callback = function(value) state.smoothing = value end })
    widgets.radius = aimTab:CreateSlider({ Name = "Aimlock radius", Range = { 20, 800 }, Increment = 10,
        CurrentValue = state.radius, Suffix = "pixels", Flag = "VA_radius",
        Callback = function(value) state.radius = value end })
    widgets.part = aimTab:CreateDropdown({ Name = "Target part", Options = { "Head", "Body" },
        CurrentOption = { state.part }, MultipleOptions = false, Flag = "VA_part",
        Callback = function(value)
            state.part = type(value) == "table" and value[1] or value
            lockedPlayer = nil
        end })

    local function opponent(other, teamCheck)
        return other ~= player and (not teamCheck or player.Neutral or other.Neutral
            or not player.Team or other.Team ~= player.Team)
    end
    local function removeActor(other)
        local actor = actors[other]
        if not actor then return end
        actor.box:Destroy()
        actor.tracer:Destroy()
        if actor.highlight then actor.highlight:Destroy() end
        actors[other] = nil
        if lockedPlayer == other then lockedPlayer = nil end
    end
    local function makeActor(other)
        local box = Instance.new("Frame")
        box.Name = "PlayerBox"
        box.BorderSizePixel = 0
        box.BackgroundColor3 = tint
        box.Visible = false
        box.Parent = gui
        local outline = Instance.new("UIStroke")
        outline.Color = tint
        outline.Thickness = 2
        outline.Parent = box
        local tracer = Instance.new("Frame")
        tracer.Name = "PlayerTracer"
        tracer.AnchorPoint = Vector2.new(0.5, 0.5)
        tracer.BorderSizePixel = 0
        tracer.BackgroundColor3 = tint
        tracer.Visible = false
        tracer.Parent = gui
        local actor = { box = box, outline = outline, tracer = tracer }
        actors[other] = actor
        return actor
    end
    local function getBounds(camera, character)
        local cf, size = character:GetBoundingBox()
        local minX, minY, maxX, maxY = math.huge, math.huge, -math.huge, -math.huge
        for _, x in { -1, 1 } do
            for _, y in { -1, 1 } do
                for _, z in { -1, 1 } do
                    local point = camera:WorldToViewportPoint(cf * Vector3.new(size.X * x / 2, size.Y * y / 2, size.Z * z / 2))
                    -- Skip boxes intersecting the camera plane to avoid huge inverted rectangles.
                    if point.Z <= 0.05 then return end
                    minX, minY = math.min(minX, point.X), math.min(minY, point.Y)
                    maxX, maxY = math.max(maxX, point.X), math.max(maxY, point.Y)
                end
            end
        end
        local viewport = camera.ViewportSize
        if maxX < 0 or maxY < 0 or minX > viewport.X or minY > viewport.Y then return end
        return minX, minY, maxX, maxY
    end
    local function drawActor(other, camera)
        local actor = actors[other] or makeActor(other)
        actor.box.Visible, actor.tracer.Visible = false, false
        local character = other.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local show = state.esp and opponent(other, state.espTeamCheck) and character
            and character.Parent and humanoid and humanoid.Health > 0
        if actor.character ~= character then
            if actor.highlight then actor.highlight:Destroy() actor.highlight = nil end
            actor.character = character
        end
        if show and state.chams and not actor.highlight then
            local highlight = Instance.new("Highlight")
            highlight.Name = "SandboxCham"
            highlight.Adornee = character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor, highlight.OutlineColor = tint, tint
            highlight.OutlineTransparency = 0
            highlight.Parent = character
            actor.highlight = highlight
        end
        if actor.highlight then
            actor.highlight.Enabled = not not (show and state.chams)
            actor.highlight.FillTransparency = 1 - state.opacity / 100
        end
        if not show or not (state.boxes or state.fill or state.tracers) then return end
        local left, top, right, bottom = getBounds(camera, character)
        if not left then return end
        actor.box.Position = UDim2.fromOffset(left, top)
        actor.box.Size = UDim2.fromOffset(math.max(1, right - left), math.max(1, bottom - top))
        actor.box.BackgroundTransparency = state.fill and (1 - state.opacity / 100) or 1
        actor.outline.Enabled = state.boxes
        actor.box.Visible = state.boxes or state.fill
        if state.tracers then
            local origin = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y - 5)
            local destination = Vector2.new((left + right) / 2, bottom)
            local delta = destination - origin
            actor.tracer.Position = UDim2.fromOffset((origin.X + destination.X) / 2, (origin.Y + destination.Y) / 2)
            actor.tracer.Size = UDim2.fromOffset(delta.Magnitude, 2)
            actor.tracer.Rotation = math.deg(math.atan2(delta.Y, delta.X))
            actor.tracer.Visible = true
        end
    end
    local function aimPart(other, camera, params)
        if not other or other.Parent ~= Players or not opponent(other, state.aimTeamCheck) then return end
        local character = other.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then return end
        local part
        if state.part == "Head" then part = character:FindFirstChild("Head", true)
        else
            part = character:FindFirstChild("UpperTorso", true) or character:FindFirstChild("Torso", true)
                or character:FindFirstChild("HumanoidRootPart", true)
        end
        if not part or not part:IsA("BasePart") then return end
        local point, visible = camera:WorldToViewportPoint(part.Position)
        if not visible or point.Z <= 0 then return end
        local distance = (Vector2.new(point.X, point.Y) - camera.ViewportSize / 2).Magnitude
        if distance > state.radius then return end
        if state.wallCheck then
            local result = workspace:Raycast(camera.CFrame.Position, part.Position - camera.CFrame.Position, params)
            if result and not result.Instance:IsDescendantOf(character) then return end
        end
        return part, distance
    end
    local function track(camera, dt)
        if not state.aimlock or Input:GetFocusedTextBox()
            or (state.holdRightMouse and not Input:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) then
            lockedPlayer = nil
            return
        end
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        local excluded = { camera }
        if player.Character then table.insert(excluded, player.Character) end
        params.FilterDescendantsInstances = excluded
        local part = aimPart(lockedPlayer, camera, params)
        if not part then
            lockedPlayer = nil
            local best = state.radius
            for _, other in Players:GetPlayers() do
                local candidate, distance = aimPart(other, camera, params)
                if candidate and distance <= best then
                    part, lockedPlayer, best = candidate, other, distance
                end
            end
        end
        if part then
            local origin = camera.CFrame.Position
            if (part.Position - origin).Magnitude > 0.001 then
                camera.CFrame = camera.CFrame:Lerp(CFrame.lookAt(origin, part.Position), aimlockAlpha(state.smoothing, dt))
            end
        end
    end
    local function cleanup()
        if not alive then return end
        alive = false
        RunService:UnbindFromRenderStep(binding)
        for _, connection in connections do connection:Disconnect() end
        local keys = {}
        for other in pairs(actors) do table.insert(keys, other) end
        for _, other in keys do removeActor(other) end
        gui:Destroy()
    end
    table.insert(connections, Players.PlayerRemoving:Connect(removeActor))
    local statusElapsed = 0
    RunService:BindToRenderStep(binding, Enum.RenderPriority.Last.Value + 2, function(dt)
        if not alive then return end
        local ok, message = pcall(function()
            local camera = workspace.CurrentCamera
            if not camera then return end
            for _, other in Players:GetPlayers() do
                if other ~= player then drawActor(other, camera) end
            end
            track(camera, dt)
            statusElapsed += dt
            if statusElapsed >= 0.25 then
                statusElapsed = 0
                if lastError then status:Set(lastError)
                elseif not state.aimlock then status:Set("Aimlock off. Higher smoothing = slower tracking.")
                elseif lockedPlayer then status:Set("Tracking " .. lockedPlayer.Name .. " | smoothing " .. state.smoothing)
                elseif state.holdRightMouse and not Input:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                    status:Set("Hold right mouse to acquire a target.")
                else status:Set("No target: check radius, team filter, visibility, and living players.") end
            end
        end)
        if not ok then
            state.esp, state.aimlock = false, false
            lockedPlayer = nil
            lastError = "ESP/aimlock error: " .. tostring(message)
            status:Set(lastError)
            for _, actor in pairs(actors) do
                actor.box.Visible, actor.tracer.Visible = false, false
                if actor.highlight then actor.highlight.Enabled = false end
            end
            warn(lastError)
        end
    end)
    local api = {}
    function api:export() return validateVisualAimConfig(state) end
    function api:prepare(saved)
        local normalized = validateVisualAimConfig(saved)
        return function()
            for key, value in pairs(normalized) do
                widgets[key]:Set(key == "part" and { value } or value)
            end
            lockedPlayer = nil
        end
    end
    return cleanup, api
end

local function createNamedConfigStore(options)
    local fs, json = options.fs, options.json
    local scope = tostring(options.gameId) .. "_" .. tostring(options.userId)
    local directory = "SandboxHubConfigs/" .. scope
    local persistent = true
    for _, key in { "isfolder", "makefolder", "isfile", "writefile", "readfile", "listfiles", "delfile" } do
        if type(fs[key]) ~= "function" then persistent = false end
    end
    local memory = options.memory
    memory[scope] = memory[scope] or {}
    local session = memory[scope]
    local store = { persistent = persistent, directory = directory }
    local function nameCheck(name)
        assert(type(name) == "string" and #name >= 1 and #name <= 40
            and name:match("^[%w_-]+$"), "Use 1–40 letters, numbers, underscores or hyphens for the config name.")
        return name
    end
    local function ensureDirectory()
        if not fs.isfolder("SandboxHubConfigs") then fs.makefolder("SandboxHubConfigs") end
        if not fs.isfolder(directory) then fs.makefolder(directory) end
    end
    local function filePath(name) return directory .. "/" .. nameCheck(name) .. ".json" end
    function store:save(name, settings)
        nameCheck(name)
        local encoded = json.encode({ version = 1, scope = scope, settings = settings })
        if not persistent then session[name] = encoded return end
        ensureDirectory()
        local path = filePath(name)
        local previous = fs.isfile(path) and fs.readfile(path) or nil
        local ok, message = pcall(function()
            fs.writefile(path, encoded)
            assert(fs.readfile(path) == encoded, "Saved config could not be verified.")
        end)
        if not ok then
            -- Preserve an existing config if a failed write can be rolled back.
            local restored = pcall(function()
                if previous then fs.writefile(path, previous)
                elseif fs.isfile(path) then fs.delfile(path) end
            end)
            error(tostring(message) .. (restored and "" or " Previous file could not be restored."), 0)
        end
    end
    function store:load(name)
        nameCheck(name)
        local encoded
        if persistent then
            local path = filePath(name)
            assert(fs.isfile(path), "Config does not exist: " .. name)
            encoded = fs.readfile(path)
        else
            encoded = session[name]
            assert(encoded, "Config does not exist: " .. name)
        end
        assert(#encoded <= 262144, "Config is too large.")
        local document = json.decode(encoded)
        assert(type(document) == "table" and document.version == 1, "Unsupported config format/version.")
        assert(document.scope == scope, "This config belongs to another experience or account.")
        assert(type(document.settings) == "table", "Config settings are missing.")
        return document.settings
    end
    function store:delete(name)
        nameCheck(name)
        if persistent then
            local path = filePath(name)
            assert(fs.isfile(path), "Config does not exist: " .. name)
            fs.delfile(path)
        else
            assert(session[name], "Config does not exist: " .. name)
            session[name] = nil
        end
    end
    function store:list()
        local names = {}
        if persistent then
            ensureDirectory()
            for _, path in fs.listfiles(directory) do
                local name = path:gsub("\\", "/"):match("([^/]+)%.json$")
                if name and #name <= 40 and name:match("^[%w_-]+$") then table.insert(names, name) end
            end
        else
            for name in session do table.insert(names, name) end
        end
        table.sort(names)
        return names
    end
    return store
end

local function validateAimConfig(value)
    assert(type(value) == "table", "Silent aim settings are missing.")
    local result = {}
    for _, key in { "enabled", "showFOV", "teamCheck", "wallCheck" } do
        assert(type(value[key]) == "boolean", "Invalid aim setting: " .. key)
        result[key] = value[key]
    end
    for key, bounds in { chance = { 0, 100 }, radius = { 20, 800 } } do
        local number = value[key]
        assert(type(number) == "number" and number == number and number >= bounds[1]
            and number <= bounds[2], "Invalid aim setting: " .. key)
        result[key] = number
    end
    assert(value.hitPart == "Random" or value.hitPart == "Head" or value.hitPart == "Body", "Invalid hit part.")
    result.hitPart = value.hitPart
    return result
end

local function installConfigUI(window, Rayfield, store, capture, prepare)
    local tab = window:CreateTab("Configs", 4483362458)
    local mode = store.persistent and ("Files: " .. store.directory)
        or "Session only: this executor does not provide all required file APIs."
    tab:CreateLabel(mode)
    local status = tab:CreateLabel("Choose a name, then Save. Load restores all saved settings.")
    local name = "default"
    local input = tab:CreateInput({ Name = "Config name", CurrentValue = name,
        PlaceholderText = "e.g. main or practice", RemoveTextAfterFocusLost = false,
        Flag = "CFG_Name", Callback = function(value)
            name = tostring(value):match("^%s*(.-)%s*$")
        end })
    local dropdown = tab:CreateDropdown({ Name = "Saved configs", Options = { "(none saved)" },
        CurrentOption = { "(none saved)" }, MultipleOptions = false, Flag = "CFG_List",
        Callback = function(value)
            local selected = type(value) == "table" and value[1] or value
            if selected and selected ~= "(none saved)" then
                name = selected
                input:Set(selected)
            end
        end })
    local function refresh(preferred)
        local names = store:list()
        if #names == 0 then names = { "(none saved)" } end
        dropdown:Refresh(names)
        if preferred and table.find(names, preferred) then dropdown:Set({ preferred })
        else dropdown:Set({ names[1] }) end
    end
    local function run(action)
        return function()
            local ok, message = pcall(action)
            if not ok then
                status:Set("Config error: " .. tostring(message))
                Rayfield:Notify({ Title = "Configs", Content = tostring(message), Duration = 7 })
            end
        end
    end
    tab:CreateButton({ Name = "Save config (overwrite if it exists)", Callback = run(function()
        local savedName = name
        store:save(savedName, capture())
        status:Set("Saved " .. savedName .. (store.persistent and " to file." or " for this session only."))
        refresh(savedName)
    end) })
    tab:CreateButton({ Name = "Load config", Callback = run(function()
        local savedName = name
        local commit = prepare(store:load(savedName))
        commit()
        status:Set("Loaded " .. savedName .. ". Switch weapons to refresh loaded skins.")
    end) })
    tab:CreateButton({ Name = "Delete config", Callback = run(function()
        local deletedName = name
        store:delete(deletedName)
        status:Set("Deleted " .. deletedName .. ".")
        refresh()
    end) })
    tab:CreateButton({ Name = "Refresh config list", Callback = run(function() refresh(name) end) })
    run(function() refresh(name) end)()
end

-- Local skin presentation, adapted to the module interfaces in the supplied source.
local function installSkinChanger(window, Rayfield, player, dependencies)
    dependencies = dependencies or {}
    local RS = dependencies.replicatedStorage or game:GetService("ReplicatedStorage")
    local loadModule = dependencies.requireModule or require
    local tab = window:CreateTab("Skin Changer", 4483362458)
    local status = tab:CreateLabel("Loading skin catalog…")
    local patches, overrides = {}, {}
    local active, enabled = true, true
    local configAPI
    local constructingWeapon
    local function notify(message)
        Rayfield:Notify({ Title = "Skin Changer", Content = message, Duration = 6 })
    end
    local function cleanup()
        if not active then return end
        active = false
        table.clear(overrides)
        for index = #patches, 1, -1 do
            local patch = patches[index]
            -- Respect a later script that may have replaced this method.
            if patch.module[patch.key] == patch.wrapper then
                patch.module[patch.key] = patch.original
            end
        end
        table.clear(patches)
    end
    local function path(root, names)
        for _, name in names do
            root = root:FindFirstChild(name)
            if not root then error("Missing module path: " .. table.concat(names, ".")) end
        end
        return root
    end
    local function patch(module, key, factory)
        assert(type(module[key]) == "function", "Missing weapon method: " .. key)
        local original = module[key]
        local wrapper = factory(original)
        table.insert(patches, { module = module, key = key, original = original, wrapper = wrapper })
        module[key] = wrapper
    end
    local ok, reason = pcall(function()
        local cosmetics = loadModule(path(RS, { "Modules", "CosmeticLibrary" }))
        local enums = loadModule(path(RS, { "Modules", "EnumLibrary" }))
        local replicatedClass = loadModule(path(RS, { "Modules", "ReplicatedClass" }))
        local playerData = loadModule(path(player.PlayerScripts, { "Controllers", "PlayerDataController" }))
        local itemModule = path(player.PlayerScripts,
            { "Modules", "ClientReplicatedClasses", "ClientFighter", "ClientItem" })
        local clientItem = loadModule(itemModule)
        local viewModel = loadModule(path(itemModule, { "ClientViewModel" }))
        assert(type(cosmetics.Cosmetics) == "table", "CosmeticLibrary.Cosmetics is missing.")
        local dataKey = assert(replicatedClass:ToEnum("Data"), "Data enum is missing.")
        local skinKey = assert(replicatedClass:ToEnum("Skin"), "Skin enum is missing.")
        local nameKey = assert(replicatedClass:ToEnum("Name"), "Name enum is missing.")

        local catalog, weapons = {}, {}
        for name, info in pairs(cosmetics.Cosmetics) do
            if type(name) == "string" and type(info) == "table" and info.Type == "Skin"
                and type(info.ItemName) == "string" and not name:find("MISSING_", 1, true) then
                if not catalog[info.ItemName] then
                    catalog[info.ItemName] = {}
                    table.insert(weapons, info.ItemName)
                end
                table.insert(catalog[info.ItemName], name)
            end
        end
        table.sort(weapons)
        assert(#weapons > 0, "No weapon skins with Type=Skin and ItemName were found.")
        for _, list in pairs(catalog) do table.sort(list) end
        local function skinData(name)
            local record = table.clone(assert(cosmetics.Cosmetics[name], "Unknown skin: " .. name))
            record.Name = name
            record.Type = "Skin"
            record.Seed = math.random(1, 1000000)
            local enumOK, enum = pcall(function() return enums:ToEnum(name) end)
            if enumOK and enum ~= nil then record.Enum, record.ObjectID = enum, enum end
            return record
        end
        local function selection(weapon)
            if active and enabled then return overrides[weapon] end
        end
        local function localItem(item)
            return item and item.ClientFighter and item.ClientFighter.Player == player
        end
        local function rewriteReference(reference, selected, weapon, replaceName)
            assert(type(reference) == "table", "Unexpected weapon reference format.")
            -- Copy only the branches being changed, leaving replicated data untouched.
            local copy = table.clone(reference)
            local key = copy[dataKey] ~= nil and dataKey or (copy.Data ~= nil and "Data" or dataKey)
            local originalData = copy[key]
            assert(originalData == nil or type(originalData) == "table", "Unexpected weapon Data format.")
            local data = originalData and table.clone(originalData) or {}
            copy[key] = data
            if key == "Data" then
                data.Skin = selected.skin and table.clone(selected.skin) or nil
                if replaceName then data.Name = selected.skin and selected.skin.Name or weapon end
            else
                data[skinKey] = selected.skin and table.clone(selected.skin) or nil
                if replaceName then data[nameKey] = selected.skin and selected.skin.Name or weapon end
            end
            return copy
        end
        patch(playerData, "GetWeaponData", function(original)
            return function(self, weapon, ...)
                local result = table.pack(original(self, weapon, ...))
                local selected = selection(weapon)
                if selected and type(result[1]) == "table" then
                    result[1] = table.clone(result[1])
                    result[1].Skin = selected.skin and table.clone(selected.skin) or nil
                end
                return table.unpack(result, 1, result.n)
            end
        end)
        patch(clientItem, "_CreateViewModel", function(original)
            return function(self, reference, ...)
                local selected = localItem(self) and selection(self.Name)
                if not selected then return original(self, reference, ...) end
                local previous = constructingWeapon
                constructingWeapon = self.Name
                local result = table.pack(pcall(function(...)
                    return original(self, rewriteReference(reference, selected, self.Name, true), ...)
                end, ...))
                constructingWeapon = previous
                if not result[1] then error(result[2], 0) end
                return table.unpack(result, 2, result.n)
            end
        end)
        patch(viewModel, "new", function(original)
            return function(reference, item, ...)
                local weapon = constructingWeapon or (item and item.Name)
                local selected = localItem(item) and selection(weapon)
                if selected then reference = rewriteReference(reference, selected, weapon, false) end
                return original(reference, item, ...)
            end
        end)

        local selectedWeapon, selectedSkin = weapons[1], "Use equipped skin"
        local skinDropdown
        local function skinOptions(weapon)
            local list = { "Use equipped skin", "No skin", "Random" }
            for _, name in catalog[weapon] or {} do table.insert(list, name) end
            return list
        end
        local function refreshNotice(message)
            status:Set(message .. " Switch to another weapon and back to rebuild its model.")
            -- The supplied source uses this local data notification to refresh inventory UI.
            local current = playerData.CurrentData
            if current and type(current.Replicate) == "function" then
                local refreshed, refreshError = pcall(function() current:Replicate("WeaponInventory") end)
                if not refreshed then warn("[Skin Changer] Inventory refresh: " .. tostring(refreshError)) end
            end
        end
        local enableWidget = tab:CreateToggle({ Name = "Enable skin overrides", CurrentValue = true, Flag = "SC_Enabled",
            Callback = function(value)
                enabled = value
                refreshNotice(value and "Overrides enabled." or "Overrides disabled.")
            end })
        local weaponWidget = tab:CreateDropdown({ Name = "Weapon", Options = weapons, CurrentOption = { selectedWeapon },
            MultipleOptions = false, Flag = "SC_Weapon", Callback = function(value)
                local weapon = type(value) == "table" and value[1] or value
                if not catalog[weapon] then return end
                selectedWeapon, selectedSkin = weapon, "Use equipped skin"
                if skinDropdown then
                    skinDropdown:Refresh(skinOptions(weapon))
                    skinDropdown:Set({ selectedSkin })
                end
            end })
        skinDropdown = tab:CreateDropdown({ Name = "Skin", Options = skinOptions(selectedWeapon),
            CurrentOption = { selectedSkin }, MultipleOptions = false, Flag = "SC_Skin",
            Callback = function(value) selectedSkin = type(value) == "table" and value[1] or value end })
        local function apply()
            local name = selectedSkin
            if name == "Use equipped skin" then
                overrides[selectedWeapon] = nil
            elseif name == "No skin" then
                overrides[selectedWeapon] = { skin = nil }
            else
                if name == "Random" then
                    local list = catalog[selectedWeapon]
                    name = list[math.random(1, #list)]
                end
                local info = cosmetics.Cosmetics[name]
                if not info or info.Type ~= "Skin" or info.ItemName ~= selectedWeapon then
                    notify("Select a skin belonging to this weapon.")
                    return
                end
                overrides[selectedWeapon] = { skin = skinData(name) }
            end
            refreshNotice(selectedWeapon .. ": " .. tostring(name) .. (enabled and "." or " (overrides disabled)."))
        end
        tab:CreateButton({ Name = "Apply selected skin", Callback = apply })
        tab:CreateButton({ Name = "Apply a random skin", Callback = function()
            selectedSkin = "Random"
            skinDropdown:Set({ "Random" })
            apply()
        end })
        tab:CreateButton({ Name = "Reset this weapon", Callback = function()
            overrides[selectedWeapon] = nil
            selectedSkin = "Use equipped skin"
            skinDropdown:Set({ selectedSkin })
            refreshNotice(selectedWeapon .. " restored to its equipped skin.")
        end })
        tab:CreateButton({ Name = "Reset all skins", Callback = function()
            table.clear(overrides)
            refreshNotice("All weapons restored to their equipped skins.")
        end })
        configAPI = {}
        function configAPI:export()
            local saved = { enabled = enabled, selectedWeapon = selectedWeapon,
                selectedSkin = selectedSkin, overrides = {} }
            for weapon, selected in pairs(overrides) do
                saved.overrides[weapon] = { name = selected.skin and selected.skin.Name or "",
                    seed = selected.skin and selected.skin.Seed or nil }
            end
            return saved
        end
        function configAPI:prepare(saved)
            assert(type(saved) == "table" and type(saved.enabled) == "boolean"
                and type(saved.overrides) == "table", "Invalid skin config.")
            assert(type(saved.selectedWeapon) == "string" and catalog[saved.selectedWeapon], "Saved weapon is unavailable.")
            assert(type(saved.selectedSkin) == "string"
                and table.find(skinOptions(saved.selectedWeapon), saved.selectedSkin), "Saved skin selection is unavailable.")
            local staged = {}
            for weapon, record in pairs(saved.overrides) do
                assert(type(weapon) == "string" and catalog[weapon] and type(record) == "table"
                    and type(record.name) == "string", "Invalid saved weapon override.")
                if record.name == "" then
                    staged[weapon] = { skin = nil }
                else
                    local info = cosmetics.Cosmetics[record.name]
                    assert(info and info.Type == "Skin" and info.ItemName == weapon
                        and table.find(catalog[weapon], record.name), "Saved skin is unavailable for " .. weapon)
                    assert(type(record.seed) == "number" and record.seed >= 1 and record.seed <= 1000000
                        and record.seed % 1 == 0, "Invalid skin seed.")
                    local data = skinData(record.name)
                    data.Seed = record.seed
                    staged[weapon] = { skin = data }
                end
            end
            local savedEnabled, savedWeapon, savedSkin = saved.enabled, saved.selectedWeapon, saved.selectedSkin
            -- Validate the complete config before applying any overrides or changing controls.
            return function()
                table.clear(overrides)
                for weapon, selected in pairs(staged) do overrides[weapon] = selected end
                enabled = savedEnabled
                enableWidget:Set(savedEnabled)
                weaponWidget:Set({ savedWeapon })
                skinDropdown:Set({ savedSkin })
                refreshNotice("Skin config loaded.")
            end
        end
        status:Set("Ready: " .. #weapons .. " weapons. Choose a weapon and skin, apply, then switch weapons.")
    end)
    if not ok then
        cleanup()
        status:Set("Skin changer unavailable: " .. tostring(reason))
        notify(tostring(reason))
    end
    return cleanup, configAPI
end

-- Adapted from the weapon interface supplied in chat.
-- Requires the same game modules/remotes and executor hook APIs as that example.
local startupOK, startupError = xpcall(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    local Players = game:GetService("Players")
    local RS = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Tags = game:GetService("CollectionService")
    local player = assert(Players.LocalPlayer, "Run this on the client.")
    local playerGui = player:WaitForChild("PlayerGui")
    local environment = type(getgenv) == "function" and getgenv() or _G
    local sharedState = environment.__SandboxSilentAim
    if not sharedState then
        sharedState = {}
        environment.__SandboxSilentAim = sharedState
    end
    if sharedState.cleanup then sharedState.cleanup() end

    assert(type(loadstring) == "function", "This version needs executor loadstring support; it is not a normal Studio LocalScript.")
    local source = game:HttpGet("https://sirius.menu/rayfield")
    local chunk, compileError = loadstring(source)
    assert(chunk, compileError)
    local Rayfield = chunk()
    local config = { enabled = false, chance = 100, hitPart = "Head", radius = 300,
        showFOV = true, teamCheck = false, wallCheck = true }
    local context = { config = config, active = true, ready = false }
    sharedState.context = context
    local rng = Random.new()
    local connections = {}
    local alive = true
    local gui
    local skinCleanup, skinConfig
    local visualCleanup, visualConfig
    local function cleanup()
        if not alive then return end
        alive = false
        if skinCleanup then skinCleanup() end
        if visualCleanup then visualCleanup() end
        context.active = false
        config.enabled = false
        for _, connection in connections do connection:Disconnect() end
        if gui then gui:Destroy() end
        pcall(function() Rayfield:Destroy() end)
    end
    sharedState.cleanup = cleanup
    context.cleanup = cleanup
    local window = Rayfield:CreateWindow({
        Name = "Rivals Sandbox | Hub", LoadingTitle = "Sandbox Hub",
        LoadingSubtitle = "Rayfield", Theme = "Ocean", ShowText = "Sandbox Hub",
        ToggleUIKeybind = "K", ConfigurationSaving = { Enabled = false },
        Discord = { Enabled = false }, KeySystem = false,
    })
    skinCleanup, skinConfig = installSkinChanger(window, Rayfield, player)
    visualCleanup, visualConfig = installVisualAim(window, Rayfield, player)
    local tab = window:CreateTab("Silent Aim", 4483362458)
    local status = tab:CreateLabel("Checking weapon modules…")
    local function notify(message)
        Rayfield:Notify({ Title = "Silent Aim", Content = message, Duration = 7 })
    end
    local aimEnabledWidget = tab:CreateToggle({ Name = "Enable silent aim", CurrentValue = false, Flag = "SA_Enabled",
        Callback = function(value)
            config.enabled = value
            if value and not context.ready then notify("Weapon hook is not ready. Read the status in this tab.") end
        end })
    local chanceWidget = tab:CreateSlider({ Name = "Silent aim hit chance", Range = { 0, 100 }, Increment = 1,
        Suffix = "%", CurrentValue = 100, Flag = "SA_Chance",
        Callback = function(value) config.chance = math.clamp(value, 0, 100) end })
    local hitPartWidget = tab:CreateDropdown({ Name = "Where to hit", Options = { "Random", "Head", "Body" },
        CurrentOption = { "Head" }, MultipleOptions = false, Flag = "SA_HitPart",
        Callback = function(value)
            config.hitPart = type(value) == "table" and value[1] or value
        end })
    local radiusWidget = tab:CreateSlider({ Name = "Target radius", Range = { 20, 800 }, Increment = 10,
        Suffix = "pixels", CurrentValue = 300, Flag = "SA_Radius",
        Callback = function(value) config.radius = value end })
    local circleWidget = tab:CreateToggle({ Name = "Show target circle", CurrentValue = true, Flag = "SA_Circle",
        Callback = function(value) config.showFOV = value end })
    local teamWidget = tab:CreateToggle({ Name = "Ignore teammates", CurrentValue = false, Flag = "SA_Teams",
        Callback = function(value) config.teamCheck = value end })
    local wallWidget = tab:CreateToggle({ Name = "Check line of sight", CurrentValue = true, Flag = "SA_Walls",
        Callback = function(value) config.wallCheck = value end })
    tab:CreateButton({ Name = "Unload", Callback = cleanup })

    -- Native Roblox circle avoids an additional Drawing API dependency.
    gui = Instance.new("ScreenGui")
    gui.Name = "SandboxSilentAimCircle"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = playerGui
    local circle = Instance.new("Frame")
    circle.BackgroundTransparency = 1
    circle.AnchorPoint = Vector2.new(0.5, 0.5)
    circle.Parent = gui
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = circle
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100, 200, 255)
    stroke.Thickness = 1
    stroke.Parent = circle
    table.insert(connections, RunService.RenderStepped:Connect(function()
        local camera = workspace.CurrentCamera
        circle.Visible = config.showFOV and camera ~= nil
        if camera then
            circle.Position = UDim2.fromOffset(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
            circle.Size = UDim2.fromOffset(config.radius * 2, config.radius * 2)
        end
    end))

    -- Do not wait forever for paths that may not exist in this experience.
    local function path(root, names)
        for _, name in names do
            root = root:FindFirstChild(name)
            if not root then error("Missing weapon path: " .. table.concat(names, ".")) end
        end
        return root
    end
    local ready, reason = pcall(function()
        assert(type(hookfunction) == "function" and type(newcclosure) == "function",
            "Executor lacks hookfunction/newcclosure. These APIs are unavailable in normal Studio scripts.")
        local utility = require(path(RS, { "Modules", "Utility" }))
        local enums = require(path(RS, { "Modules", "EnumLibrary" }))
        local useItem = path(RS, { "Remotes", "Replication", "Fighter", "UseItem" })
        assert(useItem:IsA("RemoteEvent"), "UseItem must be a RemoteEvent.")
        assert(type(utility.EncodeCFrame) == "function", "Utility.EncodeCFrame is missing.")
        local startShooting = enums:ToEnum("StartShooting")
        assert(startShooting ~= nil, "StartShooting enum is missing.")

        local function bodyPart(model)
            for _, name in { "UpperTorso", "Torso", "LowerTorso", "HumanoidRootPart" } do
                local part = model:FindFirstChild(name, true)
                if part and part:IsA("BasePart") then return part end
            end
        end
        local function getPart(model, mode)
            if mode == "Body" then return bodyPart(model) end
            local head = model:FindFirstChild("Head", true)
            if head and head:IsA("BasePart") then return head end
        end
        local function chooseTarget(origin)
            local camera = workspace.CurrentCamera
            if not camera then return end
            local center = camera.ViewportSize / 2
            local best, bestDistance = nil, config.radius
            local candidates, seen = {}, {}
            local function add(model)
                if model and model:IsA("Model") and not seen[model] then
                    seen[model] = true
                    table.insert(candidates, model)
                end
            end
            for _, entity in Tags:GetTagged("Entity") do add(entity) end
            for _, other in Players:GetPlayers() do add(other.Character) end
            -- Random means one 50/50 Head/Body choice for this firing event.
            local mode = config.hitPart
            if mode == "Random" then mode = rng:NextInteger(0, 1) == 0 and "Head" or "Body" end
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            local excluded = { camera }
            if player.Character then table.insert(excluded, player.Character) end
            params.FilterDescendantsInstances = excluded
            for _, model in candidates do
                if model == player.Character then continue end
                local owner = Players:GetPlayerFromCharacter(model)
                if config.teamCheck and owner and not player.Neutral and not owner.Neutral
                    and player.Team ~= nil and player.Team == owner.Team then continue end
                local humanoid = model:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health <= 0 then continue end
                local part = getPart(model, mode)
                if not part then continue end
                local point, visible = camera:WorldToViewportPoint(part.Position)
                if not visible or point.Z <= 0 then continue end
                local distance = (Vector2.new(point.X, point.Y) - center).Magnitude
                if distance > bestDistance then continue end
                if (part.Position - origin).Magnitude < 0.001 then continue end
                if config.wallCheck then
                    local hit = workspace:Raycast(origin, part.Position - origin, params)
                    if hit and not hit.Instance:IsDescendantOf(model) then continue end
                end
                best, bestDistance = part, distance
            end
            return best
        end
        context.rewrite = function(...)
            -- Preserve every argument, including trailing arguments and nil values.
            local args = table.pack(...)
            if args[1] ~= useItem or args[3] ~= startShooting then return end
            if not config.enabled or config.chance <= 0 then return end
            if config.chance < 100 and rng:NextNumber(0, 100) >= config.chance then return end
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not root or not root:IsA("BasePart") then return end
            local target = chooseTarget(root.Position)
            if not target then return end
            local cf = target.CFrame
            args[4] = {
                [utf8.char(1)] = {
                    [utf8.char(0)] = utility:EncodeCFrame(CFrame.lookAt(root.Position, target.Position)),
                    [utf8.char(1)] = utility:EncodeCFrame(cf),
                    [utf8.char(2)] = target,
                    [utf8.char(3)] = utility:EncodeCFrame(cf:ToObjectSpace(CFrame.new(target.Position))),
                },
            }
            return args
        end
        -- Install once. Re-executing swaps the context rather than stacking hooks.
        if not sharedState.installed then
            local original
            original = hookfunction(useItem.FireServer, newcclosure(function(...)
                local current = sharedState.context
                if current and current.active and current.ready then
                    local ok, rewritten = pcall(current.rewrite, ...)
                    if ok and rewritten then return original(table.unpack(rewritten, 1, rewritten.n)) end
                    if not ok then
                        current.lastError = tostring(rewritten)
                        -- Preserve the original shot if rewriting fails.
                    end
                end
                return original(...)
            end))
            sharedState.installed = true
        end
    end)
    if not alive then return end
    context.ready = ready
    if ready then
        status:Set("Ready | Hit chance applies per StartShooting event. Enable silent aim above.")
    else
        status:Set("Unavailable: " .. tostring(reason))
        notify(tostring(reason))
    end
    environment.__SandboxHubConfigMemory = environment.__SandboxHubConfigMemory or {}
    local http = game:GetService("HttpService")
    local configStore = createNamedConfigStore({
        gameId = game.GameId, userId = player.UserId,
        memory = environment.__SandboxHubConfigMemory,
        fs = { isfolder = isfolder, makefolder = makefolder, isfile = isfile,
            writefile = writefile, readfile = readfile, listfiles = listfiles, delfile = delfile },
        json = { encode = function(value) return http:JSONEncode(value) end,
            decode = function(value) return http:JSONDecode(value) end },
    })
    local function captureConfig()
        return { aim = validateAimConfig(config), skins = skinConfig and skinConfig:export() or nil,
            visualAim = visualConfig:export() }
    end
    local function prepareConfig(saved)
        assert(type(saved) == "table", "Config settings must be a table.")
        local aim = validateAimConfig(saved.aim)
        local commitSkins
        if saved.skins ~= nil then
            assert(skinConfig, "Cannot load skins because the skin changer is unavailable.")
            commitSkins = skinConfig:prepare(saved.skins)
        end
        local commitVisuals
        if saved.visualAim ~= nil then commitVisuals = visualConfig:prepare(saved.visualAim) end
        -- Validation above is complete before any live settings are changed.
        return function()
            aimEnabledWidget:Set(false)
            chanceWidget:Set(aim.chance)
            hitPartWidget:Set({ aim.hitPart })
            radiusWidget:Set(aim.radius)
            circleWidget:Set(aim.showFOV)
            teamWidget:Set(aim.teamCheck)
            wallWidget:Set(aim.wallCheck)
            if commitSkins then commitSkins() end
            if commitVisuals then commitVisuals() end
            aimEnabledWidget:Set(aim.enabled)
        end
    end
    installConfigUI(window, Rayfield, configStore, captureConfig, prepareConfig)
    local accumulated = 0
    table.insert(connections, RunService.Heartbeat:Connect(function(dt)
        accumulated += dt
        if accumulated < 0.5 then return end
        accumulated = 0
        if context.lastError then status:Set("Shot rewrite failed: " .. context.lastError) end
    end))
end, function(message) return debug.traceback(tostring(message), 2) end)
if not startupOK then
    warn("[Sandbox Silent Aim] " .. tostring(startupError))
    local environment = type(getgenv) == "function" and getgenv() or _G
    local state = environment.__SandboxSilentAim
    if state and state.cleanup then state.cleanup() end
    local player = game:GetService("Players").LocalPlayer
    if player then
        local gui = Instance.new("ScreenGui")
        gui.Name = "SandboxSilentAimError"
        gui.ResetOnSpawn = false
        local label = Instance.new("TextLabel")
        label.Size = UDim2.fromScale(0.9, 0.4)
        label.Position = UDim2.fromScale(0.05, 0.1)
        label.BackgroundColor3 = Color3.fromRGB(35, 20, 25)
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextSize = 15
        label.TextWrapped = true
        label.Text = "SILENT AIM STARTUP FAILED\n\n" .. tostring(startupError)
        label.Parent = gui
        gui.Parent = player:WaitForChild("PlayerGui")
    end
end
