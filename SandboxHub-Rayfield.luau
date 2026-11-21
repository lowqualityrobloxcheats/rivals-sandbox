-- Jew Hub: expanded from the user-supplied reference interfaces.
local extraSchema = {
    {"Combat Extras","aimMode","Aimlock activation","Always",{"Always","Hold","Toggle"}},
    {"Combat Extras","aimScope","Aimlock only while scoped",false},
    {"Combat Extras","aimReload","Pause aimlock while reloading",true},
    {"Combat Extras","aimInstant","Instant aimlock",false},
    {"Combat Extras","aimContinuous","Continuously pick closest target",false},
    {"Combat Extras","aimTrackWalls","Track aimlock through walls",false},
    {"Combat Extras","aimPrediction","Aimlock prediction (seconds)",0,0,0.5,0.01},
    {"Combat Extras","correctShots","Correct shots toward aimlock target",false},
    {"Combat Extras","silentMode","Silent aim activation","Always",{"Always","Hold","Toggle"}},
    {"Combat Extras","silentSticky","Sticky silent target",true},
    {"Combat Extras","silentPriority","Silent target priority","Crosshair",{"Crosshair","Distance","Health"}},
    {"Combat Extras","silentPrediction","Silent prediction (seconds)",0,0,0.5,0.01},
    {"Combat Extras","headChance","Random head percentage",50,0,100,1},
    {"Combat Extras","vulnerable","Skip spawn protection",true},
    {"Combat Extras","ignoreShield","Skip shielded targets",false},
    {"Combat Extras","ignoreDeflect","Skip deflecting targets",true},
    {"Combat Extras","healthLead","Prefer lower-health silent targets",false},
    {"Combat Extras","ragePriority","Stronger low-health preference",false},
    {"Combat Extras","maxDistance","General target distance",2000,100,5000,50},
    {"Combat Extras","trigger","Triggerbot (crosshair target)",false},
    {"Combat Extras","triggerDelay","Trigger interval (ms)",120,20,1000,10},
    {"Combat Extras","flick","Flickbot (hold F)",false},
    {"Rage Extras","autoShoot","Ragebot auto shoot",true},
    {"Rage Extras","strafe","Orbit ragebot target",false},
    {"Rage Extras","strafeRadius","Orbit radius (studs)",14,6,30,1},
    {"Rage Extras","strafeSpeed","Orbit speed",6,2,15,0.5},
    {"Rage Extras","autoplay","Pathfind toward a target",false},
    {"Rage Extras","stopDistance","Autoplay stop distance",18,8,40,1},
    {"Melee","meleeAura","Melee aura",false},
    {"Melee","knifeRage","Knife auto attack",false},
    {"Melee","extendMelee","Extend aura acquisition range",false},
    {"Melee","backstab","Face target for heavy attacks",false},
    {"Melee","meleeRange","Melee acquisition range",14,6,30,1},
    {"Movement","speed","Override walk speed",false},
    {"Movement","walkSpeed","Walk speed",16,8,200,1},
    {"Movement","jump","Override jump power",false},
    {"Movement","jumpPower","Jump power",50,0,300,5},
    {"Movement","infiniteJump","Extra jumps",false},
    {"Movement","bhop","Bunny hop while holding Space",false},
    {"Movement","fly","Fly",false},
    {"Movement","flySpeed","Fly speed",50,10,150,5},
    {"Movement","noclip","Noclip",false},
    {"Movement","antiAim","Rotate character",false},
    {"Movement","antiAimMode","Rotation mode","Spin",{"Spin","Jitter","Backwards"}},
    {"Movement","spinSpeed","Rotation speed",10,1,100,1},
    {"Gun Mods","noRecoil","No recoil",false},
    {"Gun Mods","noSpread","No spread",false},
    {"Gun Mods","antiShake","Suppress viewmodel recoil shake",false},
    {"Gun Mods","fastReload","Fast reload (client stats)",false},
    {"Gun Mods","rapidFire","Rapid fire (client stats)",false},
    {"Gun Mods","instantEquip","Instant equip (client stats)",false},
    {"Gun Mods","automatic","Automatic input while holding fire",false},
    {"Gun Mods","infiniteAmmo","Expanded ammo capacity (client stats)",false},
    {"ESP Extras","espNames","Player names",true},
    {"ESP Extras","espDistance","Distance labels",true},
    {"ESP Extras","espHealth","Health bars",true},
    {"ESP Extras","espWeapon","Weapon labels",false},
    {"ESP Extras","espSkeleton","Skeletons",false},
    {"ESP Extras","espHead","Head dots",false},
    {"ESP Extras","espTripmines","Tripmine highlights",false},
    {"ESP Extras","espLobby","Show outside duels",true},
    {"ESP Extras","espRange","ESP distance limit",500,100,5000,50},
    {"Target HUD","targetVisuals","Enable target display",false},
    {"Target HUD","targetHUD","Target health/name card",true},
    {"Target HUD","targetPath","Ground path and arrows",false},
    {"Target HUD","arrowSpacing","Arrow spacing",10,5,25,1},
    {"Target HUD","arrowSpeed","Arrow travel speed",14,5,30,1},
    {"Viewmodel","rainbow","Rainbow weapon colors",false},
    {"Viewmodel","weaponChams","Neon weapon chams",false},
    {"Viewmodel","hideWeapon","Hide local viewmodel",false},
    {"Viewmodel","viewZoom","Viewmodel zoom approximation",false},
    {"Viewmodel","viewFOV","Viewmodel zoom angle",70,50,110,1},
    {"Viewmodel","viewX","Viewmodel X offset",0,-3,3,0.1},
    {"Viewmodel","viewY","Viewmodel Y offset",0,-3,3,0.1},
    {"Viewmodel","viewZ","Viewmodel Z offset",0,-3,3,0.1},
    {"World","fullbright","Fullbright",false},
    {"World","noFog","Remove fog / atmosphere",false},
    {"World","cameraFOV","Override camera FOV",false},
    {"World","fov","Camera FOV",90,50,120,1},
    {"World","bulletTracers","Local shot tracers",false},
    {"World","hitSound","Hit sound","Off",{"Off","Skeet","Rust","Ding"}},
    {"Camera","thirdPerson","Third person",false},
    {"Camera","thirdDistance","Third-person distance",12,5,30,1},
    {"Camera","freecam","Freecam",false},
    {"Camera","freeSpeed","Freecam speed",40,10,100,5},
    {"Automation","autoRespawn","Auto respawn",false},
    {"Automation","autoQueue","Auto queue",false},
    {"Automation","queueMode","Queue mode","1v1",{"1v1","2v2","3v3","4v4","5v5"}},
    {"Automation","autoVote","Auto vote preferred maps",false},
    {"Automation","maps","Map priority","Arena, Onyx, Crossroads"},
    {"Automation","autoBan","Auto ban preferred weapons",false},
    {"Automation","bans","Weapon ban priority","Grenade Launcher, Minigun, RPG"},
    {"Automation","secondBans","Second ban priority","Grenade Launcher, Minigun, RPG"},
    {"Automation","autoLoadout","Auto loadout",false},
    {"Automation","mapsOnly","Loadout only on selected maps",false},
    {"Automation","enabledMaps","Selected maps","Arena, Crossroads"},
    {"Automation","autoPickup","Pick up nearby drops",false},
    {"Automation","pickupRange","Pickup radius",25,10,60,1},
    {"Detectors","speedDetector","Unusual-speed detector",false},
    {"Detectors","notifySpeed","Notify on unusual speed",true},
    {"Detectors","loadOnDetect","Load config on detection",false},
    {"Detectors","detectProfile","Config to load","rage"},
    {"Detectors","speedThreshold","Speed threshold",180,50,400,5},
    {"Detectors","speedDuration","Required duration (seconds)",0.75,0.1,3,0.05},
    {"Detectors","modDetector","Staff-name / rank detector",false},
    {"Detectors","notifyMods","Notify on matching staff",true},
    {"Detectors","groupId","Staff group ID (0 uses creator group)",0,0,1000000000,1},
    {"Detectors","minRank","Minimum staff group rank",200,1,255,1},
    {"Detectors","modNames","Staff usernames",""},
    {"Detectors","modFriends","Staff friend account names",""},
    {"Cosmetic Preview","unlockInventory","Preview unlocked client inventory",false},
    {"Session","resumeTeleport","Reload this hub after teleport",false},
    {"Session","watermark","FPS / ping watermark",true},
}

local function validateExtras(saved)
    assert(type(saved) == "table", "Feature-pack settings must be a table.")
    local normalized = {}
    for _, entry in extraSchema do
        local key, default = entry[2], entry[4]
        local value = saved[key]
        if value == nil then value = default end
        assert(type(value) == type(default), "Invalid feature setting: " .. key)
        if type(default) == "number" then
            assert(value == value and value >= entry[5] and value <= entry[6], "Out-of-range feature setting: " .. key)
        elseif type(default) == "string" then
            assert(#value <= 2000, "Feature setting is too long: " .. key)
            if type(entry[5]) == "table" then assert(table.find(entry[5], value), "Invalid option: " .. key) end
        end
        normalized[key] = value
    end
    return normalized
end


local function validateRageConfig(saved)
    assert(type(saved) == "table", "Ragebot settings are missing.")
    local result = {}
    for _, key in { "enabled", "holdV", "teamCheck", "wallCheck", "autoSwitch", "autoReload", "snapCamera" } do
        assert(type(saved[key]) == "boolean", "Invalid ragebot setting: " .. key)
        result[key] = saved[key]
    end
    -- Profiles saved before point-blank mode keep their original firing behavior.
    for key, default in pairs({ pointBlank = false, skipDeflect = true, sticky = true }) do
        assert(saved[key] == nil or type(saved[key]) == "boolean", "Invalid ragebot setting: " .. key)
        if saved[key] == nil then result[key] = default else result[key] = saved[key] end
    end
    result.settleMs=saved.settleMs==nil and 50 or saved.settleMs
    assert(type(result.settleMs)=="number" and result.settleMs==result.settleMs and result.settleMs>=0 and result.settleMs<=250,"Invalid point-blank settling time.")
    result.holdMs=saved.holdMs==nil and 150 or saved.holdMs
    assert(type(result.holdMs)=="number" and result.holdMs==result.holdMs and result.holdMs>=0 and result.holdMs<=1000,"Invalid post-attack hold time.")
    result.meleeAttack=saved.meleeAttack==nil and "Light" or saved.meleeAttack
    assert(result.meleeAttack=="Light" or result.meleeAttack=="Heavy","Invalid melee attack mode.")
    for key, bounds in { range = { 10, 2000 }, intervalMs = { 20, 1000 } } do
        local value = saved[key]
        assert(type(value) == "number" and value == value and value >= bounds[1]
            and value <= bounds[2], "Invalid ragebot setting: " .. key)
        result[key] = value
    end
    assert(saved.part == "Head" or saved.part == "Body" or saved.part == "Random", "Invalid ragebot hit part.")
    assert(saved.priority == "Distance" or saved.priority == "Health" or saved.priority == "Flagged", "Invalid ragebot target priority.")
    assert(saved.preferred == "Primary" or saved.preferred == "Secondary" or saved.preferred == "Melee", "Invalid preferred weapon.")
    result.part, result.priority, result.preferred = saved.part, saved.priority, saved.preferred
    return result
end

local function installRagebot(window, Rayfield, player)
    local RS = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Input = game:GetService("UserInputService")
    local state = { enabled = false, holdV = false, teamCheck = true, wallCheck = false,
        pointBlank = true, skipDeflect = true, sticky = true, settleMs = 50, holdMs = 150, meleeAttack = "Light",
        autoSwitch = true, autoReload = true, snapCamera = false, range = 2000,
        intervalMs = 100, part = "Head", priority = "Distance", preferred = "Primary" }
    local tab = window:CreateTab("Ragebot", 4483362458)
    local label = tab:CreateLabel("Loading weapon controller…")
    local widgets, connections, patches = {}, {}, {}
    local alive, ready = true, false
    local targetPlayer, targetPart, shootingItem, shootingAction
    local fighterController, mechanics
    local featurePack
    local lastFire, lastEquip, lastReload = -math.huge, -math.huge, -math.huge
    local now = os.clock
    local renderName = "JewHubRage_" .. game:GetService("HttpService"):GenerateGUID(false)
    local restoreName = renderName .. "_Restore"
    local steadyName=renderName.."_SteadyCamera"
    local pendingRestore,pendingAttack,pendingRecovery
    local controllerDecision,acceptedMelee= nil,0
    local sentCount = 0
    local message, lastLabel, sinceLabel = "Off", nil, 0
    local function clearTarget()
        targetPlayer, targetPart = nil, nil
    end
    local function finishShooting()
        if shootingItem and mechanics then
            pcall(function() mechanics:EquippedItemInput(shootingAction=="StartAiming" and "FinishAiming" or "FinishShooting") end)
        end
        shootingItem = nil
        shootingAction=nil
    end
    local function restorePosition()
        RunService:UnbindFromRenderStep(restoreName)
        RunService:UnbindFromRenderStep(steadyName)
        pendingAttack=nil
        pendingRecovery=nil
        local saved = pendingRestore
        pendingRestore = nil
        if saved and saved.root.Parent and player.Character == saved.character then
            saved.root.CFrame = saved.cframe
            saved.root.AssemblyLinearVelocity = saved.velocity
            saved.root.AssemblyAngularVelocity = saved.angularVelocity
        end
    end
    local function pause(text)
        restorePosition()
        clearTarget()
        finishShooting()
        message = text
    end
    local function cleanup()
        if not alive then return end
        alive = false
        pause("Unloaded")
        RunService:UnbindFromRenderStep(renderName)
        for _, connection in connections do connection:Disconnect() end
        for index = #patches, 1, -1 do
            local patch = patches[index]
            if patch.module[patch.key] == patch.wrapper then patch.module[patch.key] = patch.ownOriginal end
        end
    end
    local function toggle(name, key)
        widgets[key] = tab:CreateToggle({ Name = name, CurrentValue = state[key], Flag = "RB_" .. key,
            Callback = function(value)
                state[key] = value
                restorePosition()
                clearTarget()
                if key == "pointBlank" and not value then restorePosition() end
                if key == "enabled" and not value then pause("Off") end
                if key == "enabled" and value and not ready then
                    Rayfield:Notify({ Title = "Ragebot", Content = "Read the weapon-controller status in this tab.", Duration = 6 })
                end
            end })
    end
    local function dropdown(name, key, options)
        widgets[key] = tab:CreateDropdown({ Name = name, Options = options, CurrentOption = { state[key] },
            MultipleOptions = false, Flag = "RB_" .. key, Callback = function(value)
                state[key] = type(value) == "table" and value[1] or value
                restorePosition()
                clearTarget()
            end })
    end
    toggle("Enable ragebot (RightAlt toggles)", "enabled")
    toggle("Only while holding V", "holdV")
    toggle("Point-blank attacks (near-target position)", "pointBlank")
    toggle("Keep target until invalid", "sticky")
    dropdown("Target part", "part", { "Head", "Body", "Random" })
    dropdown("Target priority", "priority", { "Distance", "Health", "Flagged" })
    dropdown("Preferred weapon slot", "preferred", { "Primary", "Secondary", "Melee" })
    dropdown("Melee attack", "meleeAttack", { "Light", "Heavy" })
    widgets.settleMs=tab:CreateSlider({Name="Point-blank settling time",Range={0,250},Increment=10,Suffix="ms",CurrentValue=50,Flag="RB_settleMs",
        Callback=function(value)state.settleMs=value end})
    widgets.holdMs=tab:CreateSlider({Name="Stay near target after attack",Range={0,1000},Increment=10,Suffix="ms",CurrentValue=state.holdMs,Flag="RB_holdMs",
        Callback=function(value)state.holdMs=value end})
    tab:CreateButton({Name="Apply Fists / Battle Axe melee preset",Callback=function()
        widgets.enabled:Set(false)
        widgets.preferred:Set({"Melee"})
        widgets.meleeAttack:Set({"Light"})
        widgets.part:Set({"Body"})
        widgets.pointBlank:Set(true)
        widgets.wallCheck:Set(false)
        widgets.holdV:Set(false)
        widgets.sticky:Set(true)
        widgets.settleMs:Set(100)
        widgets.holdMs:Set(150)
        widgets.intervalMs:Set(20)
        widgets.enabled:Set(true)
        Rayfield:Notify({Title="Melee preset",Content="Melee / Light / Body; Point-blank ON; line of sight OFF. Weapon cooldown still applies. Check the status for accepted or declined inputs.",Duration=8})
    end})
    toggle("Switch guns when empty", "autoSwitch")
    toggle("Auto reload", "autoReload")
    toggle("Ignore teammates / allies", "teamCheck")
    toggle("Check line of sight", "wallCheck")
    toggle("Skip deflecting katana", "skipDeflect")
    toggle("Snap camera to target", "snapCamera")
    widgets.range = tab:CreateSlider({ Name = "Maximum target distance", Range = { 10, 2000 },
        Increment = 10, Suffix = "studs", CurrentValue = state.range, Flag = "RB_range",
        Callback = function(value) state.range = value end })
    widgets.intervalMs = tab:CreateSlider({ Name = "Minimum firing interval", Range = { 20, 1000 },
        Increment = 10, Suffix = "ms", CurrentValue = state.intervalMs, Flag = "RB_interval",
        Callback = function(value) state.intervalMs = value end })
    tab:CreateLabel("Targets in all directions. Firing follows the equipped gun's cooldown. RightAlt toggles; V hold is optional.")
    tab:CreateLabel("Point-blank mode chooses a clear nearby position and settles before firing. Melee uses its native controller. Post-attack hold keeps your position through delayed swings. Accepted client attacks and sent gun shots are not confirmed hits.")

    local function path(root, names)
        for _, name in names do
            root = root:FindFirstChild(name)
            if not root then error("Missing ragebot module: " .. table.concat(names, ".")) end
        end
        return root
    end
    local loaded, failure = pcall(function()
        fighterController = require(path(player.PlayerScripts, { "Controllers", "FighterController" }))
        mechanics = require(path(player.PlayerScripts, { "Controllers", "MechanicsController" }))
        local utility = require(path(RS, { "Modules", "Utility" }))
        local enums = require(path(RS, { "Modules", "EnumLibrary" }))
        local useItem = path(RS, { "Remotes", "Replication", "Fighter", "UseItem" })
        assert(useItem:IsA("RemoteEvent"), "UseItem is not a RemoteEvent.")
        local startShooting = assert(enums:ToEnum("StartShooting"), "StartShooting enum is missing.")
        local spectate
        local spectateModule = player.PlayerScripts.Controllers:FindFirstChild("SpectateController")
        if spectateModule then
            local loadedSpectate, result = pcall(require, spectateModule)
            if loadedSpectate then spectate = result end
        end
        local gun = require(path(player.PlayerScripts, { "Modules", "ItemTypes", "Gun" }))
        local function optionalModule(names)
            local node=player.PlayerScripts
            for _,name in names do node=node and node:FindFirstChild(name) end
            if not node then return end
            local ok,module=pcall(require,node)
            if ok and type(module)=="table" then return module end
        end
        local melee=optionalModule({"Modules","ItemTypes","Melee"})
        local knife=optionalModule({"Modules","Items","Knife"})
        assert(type(mechanics.EquippedItemInput) == "function", "MechanicsController.EquippedItemInput is missing.")
        assert(type(gun.StartShooting) == "function", "Gun.StartShooting is missing.")
        assert(type(utility.EncodeCFrame) == "function", "Utility.EncodeCFrame is missing.")
        local function getRoot(character)
            return character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("HRP"))
        end
        local function getPart(character)
            local names = state.part == "Body" and { "UpperTorso", "Torso", "HumanoidRootPart", "HRP" }
                or { "PhysicalHitboxHead", "HitboxHead", "HitboxHeadSmall", "Head" }
            for _, name in names do
                local part = character:FindFirstChild(name, true)
                if part and part:IsA("BasePart") then return part end
            end
        end
        local function fighterFor(other)
            if type(fighterController.GetFighter) == "function" then
                local fighter = fighterController:GetFighter(other)
                if fighter then return fighter end
            end
            if other == player then return fighterController.LocalFighter end
        end
        local function immune(other, character)
            if character:FindFirstChildOfClass("ForceField") then return true end
            local fighter = fighterFor(other)
            local data = fighter and (fighter.Data or (fighter.Entity and fighter.Entity.Data))
            return data and data.IsInvincible == true
        end
        local function isEnemy(other)
            if other == player then return false end
            if not state.teamCheck then return true end
            local duel = spectate and spectate.CurrentDuelSubject
            if duel and type(duel.GetDueler) == "function" then
                local dueler = duel:GetDueler(player)
                local localTeam = dueler and dueler:Get("TeamID")
                if localTeam ~= nil then
                    for _, opponent in pairs(duel.Duelers or {}) do
                        if opponent.Player == other then
                            local otherTeam = opponent:Get("TeamID")
                            if otherTeam ~= nil then return localTeam ~= otherTeam end
                        end
                    end
                end
            end
            local localTeam, otherTeam = player:GetAttribute("TeamID"), other:GetAttribute("TeamID")
            if localTeam ~= nil and otherTeam ~= nil then return localTeam ~= otherTeam end
            if not player.Neutral and not other.Neutral and player.Team and player.Team == other.Team then return false end
            return not (other.Character and other.Character:GetAttribute("IsAlly") == true)
        end
        local function candidate(other, origin, params)
            if not isEnemy(other) then return end
            local character = other.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 or immune(other, character) then return end
            if state.skipDeflect then
                local otherFighter = fighterFor(other)
                local equipped = otherFighter and otherFighter.EquippedItem
                local model = equipped and equipped.ViewModel
                if model and model.Name == "Katana" and type(equipped._attack_cooldown) == "number"
                    and equipped._attack_cooldown > tick() then return end
            end
            local root, part = getRoot(character), getPart(character)
            if not root or not part then return end
            if featurePack and not featurePack:qualifies(other,part) then return end
            local distance = (root.Position - origin).Magnitude
            if distance > state.range or (part.Position - origin).Magnitude < 0.01 then return end
            if state.wallCheck then
                local hit = workspace:Raycast(origin, part.Position - origin, params)
                if hit and not hit.Instance:IsDescendantOf(character) then return end
            end
            local score=state.priority=="Health" and humanoid.Health or distance
            if state.priority=="Flagged" and ((featurePack and featurePack.suspects[other]) or other:GetAttribute("Hacker")==true) then score-=1000000 end
            return part, score, distance
        end
        local function chooseTarget(root)
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            local excluded = { player.Character }
            if workspace.CurrentCamera then table.insert(excluded, workspace.CurrentCamera) end
            params.FilterDescendantsInstances = excluded
            if state.sticky and targetPlayer and targetPlayer.Parent==Players then
                local part=candidate(targetPlayer,root.Position,params)
                if part then return targetPlayer,part end
            end
            local bestPlayer, bestPart, bestScore, bestDistance = nil, nil, math.huge, math.huge
            for _, other in Players:GetPlayers() do
                local part, score, distance = candidate(other, root.Position, params)
                if part and (score < bestScore or (score == bestScore and distance < bestDistance)) then
                    bestPlayer, bestPart, bestScore, bestDistance = other, part, score, distance
                end
            end
            return bestPlayer, bestPart
        end
        local function ammo(item, key)
            if not item or type(item.Get) ~= "function" then return end
            local value = item:Get(key)
            return type(value) == "number" and value or nil
        end
        local function available(item)
            if not item then return false end
            local count = ammo(item, "Ammo")
            return count == nil or count > 0 or (ammo(item, "AmmoReserve") or 0) > 0
        end
        local function equipGun(fighter, time)
            local preferred = state.preferred == "Melee" and 3 or (state.preferred == "Secondary" and 2 or 1)
            local items = fighter.Items or {}
            local desiredSlot = preferred
            local desired = items[preferred]
            local alternate = items[preferred == 1 and 2 or 1]
            if preferred~=3 and state.autoSwitch and alternate then
                local empty = desired and ammo(desired, "Ammo") == 0
                local alternateLoaded = (ammo(alternate, "Ammo") or 0) > 0
                if not available(desired) or (empty and alternateLoaded) then
                    desiredSlot, desired = preferred == 1 and 2 or 1, alternate
                end
            end
            if not desired then return nil, "No item found in the selected weapon slot" end
            if fighter.EquippedItem ~= desired then
                finishShooting()
                if time - lastEquip >= 0.25 then
                    assert(type(fighter.EquipItem) == "function", "Local fighter EquipItem is missing.")
                    fighter:EquipItem(desiredSlot)
                    lastEquip = time
                end
                return nil, "Equipping " .. tostring(desired.Name or desiredSlot)
            end
            return desired
        end
        local function buildPayload(root, part)
            local origin = root.CFrame.Position
            local cf = part.CFrame
            return {
                [utf8.char(0)] = utility:EncodeCFrame(CFrame.lookAt(origin, part.Position)),
                [utf8.char(1)] = utility:EncodeCFrame(cf),
                [utf8.char(2)] = part,
                [utf8.char(3)] = utility:EncodeCFrame(cf:ToObjectSpace(CFrame.new(part.Position))),
            }
        end
        local function chooseAttackPart(other,base)
            if state.part~="Random" then return base end
            local character=other.Character
            if math.random(0,1)==0 then
                return character:FindFirstChild("UpperTorso",true) or character:FindFirstChild("Torso",true) or getRoot(character) or base
            end
            return base
        end
        local attackHookDepth=0
        local function installAttackHook(module,key,action)
            if not module or type(module[key])~="function" then return false end
            local original=module[key]
            for _,patch in patches do
                if original==patch.wrapper then return true end
            end
            local ownOriginal=rawget(module,key)
            local wrapper=function(self,...)
                attackHookDepth+=1
                local call=table.pack(pcall(original,self,...))
                attackHookDepth-=1
                if not call[1] then error(call[2],0) end
                local result=table.pack(table.unpack(call,2,call.n))
                if attackHookDepth>0 then return table.unpack(result,1,result.n) end
                if not alive or not ready or not state.enabled or self~=shootingItem then
                    return table.unpack(result,1,result.n)
                end
                local accepted=result[1]==true and result[2]==action
                controllerDecision={accepted=accepted,reason=tostring(result[2] or "controller declined"),action=action}
                if not accepted or not targetPart or not targetPart.Parent then return table.unpack(result,1,result.n) end
                local root=getRoot(player.Character)
                if root then
                    local part=pendingAttack and pendingAttack.part or chooseAttackPart(targetPlayer,targetPart)
                    result[3]=buildPayload(root,part)
                    result.n=math.max(result.n,3)
                    if state.preferred=="Melee" then acceptedMelee+=1 end
                end
                return table.unpack(result,1,result.n)
            end
            table.insert(patches,{module=module,key=key,original=original,ownOriginal=ownOriginal,wrapper=wrapper})
            module[key]=wrapper
            return true
        end
        installAttackHook(gun,"StartShooting","StartShooting")
        local lightReady=installAttackHook(melee,"StartShooting","StartShooting")
        local heavyReady=installAttackHook(knife,"StartAiming","StartAiming")
        local function rayParams(other)
            local params=RaycastParams.new()
            params.FilterType=Enum.RaycastFilterType.Exclude
            local excluded={player.Character,other.Character}
            if workspace.CurrentCamera then table.insert(excluded,workspace.CurrentCamera) end
            params.FilterDescendantsInstances=excluded
            params.RespectCanCollide=true
            params.IgnoreWater=true
            return params
        end
        local function clearSegment(origin,destination,params)
            return (destination-origin).Magnitude>0.001 and workspace:Raycast(origin,destination-origin,params)==nil
        end
        local function chooseOrigin(other,part)
            local root=getRoot(other.Character)
            if not root then return end
            local params=rayParams(other)
            for _,offset in {Vector3.new(0,1,2),Vector3.new(0,1,-2),Vector3.new(2,1,0),Vector3.new(-2,1,0),Vector3.new(0,3,0)} do
                local position=(root.CFrame*CFrame.new(offset)).Position
                if clearSegment(part.Position,position,params) then return CFrame.lookAt(position,part.Position) end
            end
        end
        local function controllerAttack(item,action)
            finishShooting()
            shootingItem,shootingAction=item,action
            controllerDecision=nil
            mechanics:EquippedItemInput(action)
            if state.preferred=="Melee" then
                if controllerDecision and controllerDecision.accepted then
                    message="Melee controller accepted: "..acceptedMelee.." | target: "..targetPlayer.Name.." (damage unconfirmed)"
                else
                    message="Melee controller declined: "..(controllerDecision and controllerDecision.reason or "no matching weapon method dispatched")
                end
            end
        end
        local function processPending(time)
            local attack=pendingAttack
            if not attack then return end
            if not state.enabled or Input:GetFocusedTextBox() or (state.holdV and not Input:IsKeyDown(Enum.KeyCode.V))
                or (featurePack and (featurePack.state.freecam or not featurePack.state.autoShoot)) then pause("Point-blank attack cancelled") return end
            local character=player.Character
            local h=character and character:FindFirstChildOfClass("Humanoid")
            local targetCharacter=attack.other.Character
            local targetHumanoid=targetCharacter and targetCharacter:FindFirstChildOfClass("Humanoid")
            local lf=fighterFor(player)
            if character~=attack.character or not h or h.Health<=0 or not targetHumanoid or targetHumanoid.Health<=0
                or not attack.part.Parent or not isEnemy(attack.other) or immune(attack.other,targetCharacter)
                or not lf or lf.EquippedItem~=attack.item then pause("Point-blank target / weapon changed") return end
            if (attack.root.CFrame.Position-attack.cframe.Position).Magnitude>1 then pause("Position moved before firing; attack cancelled") return end
            if time<attack.fireAt then
                attack.root.CFrame=attack.cframe
                attack.root.AssemblyLinearVelocity=Vector3.zero
                attack.root.AssemblyAngularVelocity=Vector3.zero
                message="Settling near "..attack.other.Name.." before firing" return
            end
            if (attack.part.Position-attack.cframe.Position).Magnitude>8
                or not clearSegment(attack.cframe.Position,attack.part.Position,rayParams(attack.other)) then
                pause("Near-target firing position became blocked") return
            end
            targetPlayer,targetPart=attack.other,attack.part
            if attack.melee then
                controllerAttack(attack.item,attack.action)
            else
                finishShooting()
                shootingItem,shootingAction=attack.item,"StartShooting"
                local cf=attack.part.CFrame
                useItem:FireServer(attack.objectID,startShooting,{
                    [utf8.char(1)]={
                        [utf8.char(0)]=utility:EncodeCFrame(CFrame.lookAt(attack.cframe.Position,attack.part.Position)),
                        [utf8.char(1)]=utility:EncodeCFrame(cf),
                        [utf8.char(2)]=attack.part,
                        [utf8.char(3)]=utility:EncodeCFrame(cf:ToObjectSpace(CFrame.new(attack.part.Position))),
                    },
                },nil)
                sentCount+=1
                if featurePack then featurePack:onShot(attack.cframe.Position,attack.part.Position) end
                message="Near-target UseItem sent: "..sentCount.." | target: "..attack.other.Name.." (hits unconfirmed)"
            end
            lastFire=time
            pendingAttack=nil
            local accepted=not attack.melee or (controllerDecision and controllerDecision.accepted)
            if accepted and state.holdMs>0 then
                pendingRecovery={root=attack.root,character=attack.character,cframe=attack.cframe,
                    untilTime=time+state.holdMs/1000,status=message,other=attack.other}
            else
                RunService:BindToRenderStep(restoreName,101,restorePosition)
            end
        end
        local function processRecovery(time)
            local recovery=pendingRecovery
            if not state.enabled or Input:GetFocusedTextBox() or (state.holdV and not Input:IsKeyDown(Enum.KeyCode.V))
                or (featurePack and (featurePack.state.freecam or not featurePack.state.autoShoot)) then pause("Post-attack hold cancelled") return end
            local humanoid=player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if player.Character~=recovery.character or not humanoid or humanoid.Health<=0 then pause("Character changed during attack") return end
            if (recovery.root.CFrame.Position-recovery.cframe.Position).Magnitude>1 then pause("Position moved after attack; restored") return end
            if time>=recovery.untilTime then
                finishShooting()
                restorePosition()
                return true
            end
            recovery.root.CFrame=recovery.cframe
            recovery.root.AssemblyLinearVelocity=Vector3.zero
            recovery.root.AssemblyAngularVelocity=Vector3.zero
            message=recovery.status..string.format(" | holding %.0f ms",(recovery.untilTime-time)*1000)
        end
        local function step(dt)
            local time=now()
            if pendingRecovery then
                if not processRecovery(time) then return end
            end
            if pendingAttack then processPending(time) return end
            restorePosition()
            if not state.enabled then pause("Off") return end
            if featurePack and featurePack.state.freecam then pause("Paused: freecam") return end
            if Input:GetFocusedTextBox() then pause("Paused: text input focused") return end
            if state.holdV and not Input:IsKeyDown(Enum.KeyCode.V) then pause("Hold V to run") return end
            local character=player.Character
            local humanoid=character and character:FindFirstChildOfClass("Humanoid")
            local root=getRoot(character)
            if not root or not humanoid or humanoid.Health<=0 then pause("Waiting for your character") return end
            local lf=fighterFor(player)
            if not lf then pause("Waiting for local fighter") return end
            targetPlayer,targetPart=chooseTarget(root)
            if not targetPart then pause("No eligible target") return end
            local item,itemStatus=equipGun(lf,time)
            if not item then clearTarget() message=itemStatus return end
            local isMelee=state.preferred=="Melee"
            local action=isMelee and state.meleeAttack=="Heavy" and "StartAiming" or "StartShooting"
            local itemHook=false
            if isMelee then itemHook=installAttackHook(item,action,action) end
            if isMelee and not itemHook and ((action=="StartAiming" and not heavyReady) or (action=="StartShooting" and not lightReady)) then
                pause("Melee controller method is unavailable for the selected attack") return
            end
            -- Melee items commonly report Ammo=0: that is not an empty gun.
            if not isMelee and ammo(item,"Ammo")==0 then
                finishShooting()
                if state.autoReload and (ammo(item,"AmmoReserve") or 0)>0 then
                    if time-lastReload>=0.75 then mechanics:EquippedItemInput("StartReloading") lastReload=time end
                    message="Reloading "..tostring(item.Name or "gun")
                else message="Equipped gun is empty" end
                clearTarget() return
            end
            if isMelee and type(item._attack_cooldown)=="number" then
                local remaining=item._attack_cooldown-tick()
                if remaining>(state.pointBlank and state.settleMs/1000 or 0) and remaining<30 then
                    message=string.format("Melee cooldown: %.2fs",remaining) return
                end
            end
            local weaponCooldown=item.Info and item.Info.ShootCooldown
            weaponCooldown=type(weaponCooldown)=="number" and weaponCooldown or 0
            local interval=math.max(state.intervalMs/1000,weaponCooldown,0.02)
            message="Target: "..targetPlayer.Name.." | weapon: "..tostring(item.Name or "equipped")
                .." | gun sends: "..sentCount.." | accepted melee: "..acceptedMelee
            if featurePack and not featurePack.state.autoShoot then finishShooting() return end
            local lead=state.pointBlank and state.settleMs/1000 or 0
            if time+lead<lastFire+interval then return end
            if state.pointBlank then
                local part=chooseAttackPart(targetPlayer,targetPart)
                local attackCF=chooseOrigin(targetPlayer,part)
                if not attackCF then pause("No clear near-target firing position") return end
                local objectID=item:Get("ObjectID")
                if not isMelee then assert(objectID~=nil,"Equipped item has no ObjectID.") end
                finishShooting()
                pendingRestore={root=root,character=character,cframe=root.CFrame,
                    velocity=root.AssemblyLinearVelocity,angularVelocity=root.AssemblyAngularVelocity}
                pendingAttack={root=root,character=character,other=targetPlayer,part=part,item=item,melee=isMelee,
                    action=action,cframe=attackCF,objectID=objectID,fireAt=math.max(time+state.settleMs/1000,lastFire+interval)}
                local camera=workspace.CurrentCamera
                local originalCamera=camera and camera.CFrame
                RunService:BindToRenderStep(steadyName,Enum.RenderPriority.Last.Value+20,function()
                    if pendingRestore and not state.snapCamera and camera and workspace.CurrentCamera==camera then camera.CFrame=originalCamera end
                end)
                root.CFrame=attackCF
                root.AssemblyLinearVelocity=Vector3.zero
                root.AssemblyAngularVelocity=Vector3.zero
                message="Settling near "..targetPlayer.Name.." before firing"
                if state.settleMs==0 then processPending(time) end
            else
                controllerAttack(item,action)
                lastFire=time
            end
        end
        ready = true
        message = "Off | RightAlt toggles ragebot"
        local busy = false
        table.insert(connections, RunService.Heartbeat:Connect(function(dt)
            if not alive or busy then return end
            busy = true
            local ok, reason = pcall(step, dt)
            busy = false
            if not ok then
                state.enabled = false
                pause("Ragebot error: " .. tostring(reason))
                widgets.enabled:Set(false)
                message = "Ragebot error: " .. tostring(reason)
                warn(message)
            end
            sinceLabel += dt
            if sinceLabel >= 0.15 and message ~= lastLabel then
                sinceLabel, lastLabel = 0, message
                label:Set(message.." | Point-blank: "..(state.pointBlank and "ON" or "OFF").." | LOS: "..(state.wallCheck and "ON" or "OFF"))
            end
        end))
        RunService:BindToRenderStep(renderName, Enum.RenderPriority.Last.Value + 3, function()
            if alive and ready and state.enabled and state.snapCamera and targetPart and targetPart.Parent then
                local camera = workspace.CurrentCamera
                if camera and (targetPart.Position - camera.CFrame.Position).Magnitude > 0.01 then
                    camera.CFrame = CFrame.lookAt(camera.CFrame.Position, targetPart.Position)
                end
            end
        end)
    end)
    if not loaded then
        cleanup()
        label:Set("Unavailable: " .. tostring(failure))
        Rayfield:Notify({ Title = "Ragebot", Content = tostring(failure), Duration = 8 })
        return cleanup, nil
    end
    label:Set(message)
    table.insert(connections, Input.InputBegan:Connect(function(input, processed)
        if not processed and not Input:GetFocusedTextBox() and input.KeyCode == Enum.KeyCode.RightAlt then
            widgets.enabled:Set(not state.enabled)
        end
    end))
    local api = {}
    function api:setFeaturePack(value) featurePack=value end
    function api:getTarget() return targetPlayer,targetPart end
    function api:getDiagnostics()
        return {status=message,sent=sentCount,acceptedMelee=acceptedMelee,settling=pendingAttack~=nil,
            holding=pendingRecovery~=nil,pointBlank=state.pointBlank,wallCheck=state.wallCheck,
            weapon=shootingItem and shootingItem.Name,meleeAttack=state.meleeAttack,settleMs=state.settleMs,holdMs=state.holdMs}
    end
    function api:isActive() return alive and ready and state.enabled and targetPart ~= nil end
    function api:hasShotOverride() return self:isActive() and (shootingItem ~= nil or pendingAttack~=nil) end
    function api:export() return validateRageConfig(state) end
    function api:prepare(saved)
        local normalized = validateRageConfig(saved)
        return function()
            widgets.enabled:Set(false)
            for key, value in pairs(normalized) do
                if key ~= "enabled" then
                    local dropdownValue = key == "part" or key == "priority" or key == "preferred" or key == "meleeAttack"
                    widgets[key]:Set(dropdownValue and { value } or value)
                end
            end
            widgets.enabled:Set(normalized.enabled)
        end
    end
    return cleanup, api
end


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
    assert(saved.part == "Head" or saved.part == "Body" or saved.part == "Closest", "Invalid aimlock target part.")
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
    local featurePack, aimSuppressed
    local trackedPart
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
    widgets.part = aimTab:CreateDropdown({ Name = "Target part", Options = { "Head", "Body", "Closest" },
        CurrentOption = { state.part }, MultipleOptions = false, Flag = "VA_part",
        Callback = function(value)
            state.part = type(value) == "table" and value[1] or value
            lockedPlayer = nil
        end })

    local function opponent(other, teamCheck)
        if other~=player and teamCheck and featurePack and featurePack.isTeammate and featurePack:isTeammate(other) then return false end
        return other ~= player and (not teamCheck or player.Neutral or other.Neutral
            or not player.Team or other.Team ~= player.Team)
    end
    local function removeActor(other)
        local actor = actors[other]
        if not actor then return end
        actor.box:Destroy()
        actor.tracer:Destroy()
        for _,instance in actor.extras do instance:Destroy() end
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
        local info=Instance.new("TextLabel") info.Name="PlayerInfo" info.BackgroundTransparency=1 info.TextColor3=tint
        info.TextSize=13 info.TextWrapped=true info.Size=UDim2.fromOffset(220,48) info.Visible=false info.Parent=gui
        local health=Instance.new("Frame") health.BorderSizePixel=0 health.BackgroundColor3=Color3.fromRGB(25,25,25) health.Visible=false health.Parent=gui
        local healthFill=Instance.new("Frame") healthFill.BorderSizePixel=0 healthFill.BackgroundColor3=Color3.fromRGB(60,255,100) healthFill.Parent=health
        local dot=Instance.new("Frame") dot.BorderSizePixel=0 dot.BackgroundColor3=tint dot.Size=UDim2.fromOffset(7,7) dot.AnchorPoint=Vector2.new(0.5,0.5) dot.Visible=false dot.Parent=gui
        local dotCorner=Instance.new("UICorner") dotCorner.CornerRadius=UDim.new(1,0) dotCorner.Parent=dot
        local actor = { box = box, outline = outline, tracer = tracer, info=info,health=health,healthFill=healthFill,dot=dot,
            skeleton={},extras={info,health,dot} }
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
        for _,instance in actor.extras do instance.Visible=false end
        local character = other.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local show = state.esp and opponent(other, state.espTeamCheck) and character
            and character.Parent and humanoid and humanoid.Health > 0
        local extras=featurePack and featurePack.state
        local root=character and character:FindFirstChild("HumanoidRootPart")
        if show and extras then
            if not root or (root.Position-camera.CFrame.Position).Magnitude>extras.espRange then show=false end
            if not extras.espLobby and featurePack:isInDuel()==false then show=false end
        end
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
        if not show or not (state.boxes or state.fill or state.tracers or extras) then return end
        local left, top, right, bottom = getBounds(camera, character)
        if not left then return end
        actor.box.Position = UDim2.fromOffset(left, top)
        actor.box.Size = UDim2.fromOffset(math.max(1, right - left), math.max(1, bottom - top))
        actor.box.BackgroundTransparency = state.fill and (1 - state.opacity / 100) or 1
        actor.outline.Enabled = state.boxes
        actor.box.Visible = state.boxes or state.fill
        if extras then
            local text={}
            if extras.espNames then table.insert(text,other.DisplayName or other.Name) end
            if extras.espDistance then table.insert(text,string.format("%.0f studs",(root.Position-camera.CFrame.Position).Magnitude)) end
            if extras.espHealth then table.insert(text,string.format("%d HP",humanoid.Health)) end
            if extras.espWeapon then
                local name=featurePack:getWeaponName(other)
                if name then table.insert(text,name) end
            end
            actor.info.Text=table.concat(text," | ") actor.info.Position=UDim2.fromOffset((left+right)/2-110,top-48) actor.info.Visible=#text>0
            actor.health.Position=UDim2.fromOffset(left-7,top) actor.health.Size=UDim2.fromOffset(4,math.max(1,bottom-top))
            local fraction=math.clamp(humanoid.Health/math.max(1,humanoid.MaxHealth),0,1)
            actor.healthFill.Position=UDim2.fromScale(0,1-fraction) actor.healthFill.Size=UDim2.fromScale(1,fraction)
            actor.health.Visible=extras.espHealth
            local head=character:FindFirstChild("Head")
            if extras.espHead and head then
                local point,onScreen=camera:WorldToViewportPoint(head.Position)
                actor.dot.Position=UDim2.fromOffset(point.X,point.Y) actor.dot.Visible=onScreen and point.Z>0
            end
            if extras.espSkeleton then
                local pairsR15={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},
                    {"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
                    {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},
                    {"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
                local pairsR6={{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
                for index,pair in character:FindFirstChild("UpperTorso") and pairsR15 or pairsR6 do
                    local a,b=character:FindFirstChild(pair[1]),character:FindFirstChild(pair[2])
                    if a and b then
                        local p,onA=camera:WorldToViewportPoint(a.Position) local q,onB=camera:WorldToViewportPoint(b.Position)
                        if onA and onB and p.Z>0 and q.Z>0 then
                            local line=actor.skeleton[index]
                            if not line then
                                line=Instance.new("Frame") line.BorderSizePixel=0 line.BackgroundColor3=tint line.AnchorPoint=Vector2.new(0.5,0.5) line.Parent=gui
                                actor.skeleton[index]=line table.insert(actor.extras,line)
                            end
                            local delta=Vector2.new(q.X-p.X,q.Y-p.Y)
                            line.Position=UDim2.fromOffset((p.X+q.X)/2,(p.Y+q.Y)/2) line.Size=UDim2.fromOffset(delta.Magnitude,1)
                            line.Rotation=math.deg(math.atan2(delta.Y,delta.X)) line.Visible=true
                        end
                    end
                end
            end
        end
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
        if state.part == "Head" or state.part=="Closest" then part = character:FindFirstChild("Head", true)
            or (state.part=="Closest" and (character:FindFirstChild("UpperTorso",true) or character:FindFirstChild("HumanoidRootPart",true)))
        else
            part = character:FindFirstChild("UpperTorso", true) or character:FindFirstChild("Torso", true)
                or character:FindFirstChild("HumanoidRootPart", true)
        end
        if not part or not part:IsA("BasePart") then return end
        if state.part=="Closest" then
            local head=character:FindFirstChild("Head",true)
            local body=character:FindFirstChild("UpperTorso",true) or character:FindFirstChild("HumanoidRootPart",true)
            local best=math.huge
            for _,candidate in {head,body} do
                if candidate then local p,onScreen=camera:WorldToViewportPoint(candidate.Position)
                    local d=(Vector2.new(p.X,p.Y)-camera.ViewportSize/2).Magnitude
                    if onScreen and d<best then part,best=candidate,d end
                end
            end
        end
        if featurePack and not featurePack:qualifies(other,part) then return end
        local point, visible = camera:WorldToViewportPoint(part.Position)
        if not visible or point.Z <= 0 then return end
        local distance = (Vector2.new(point.X, point.Y) - camera.ViewportSize / 2).Magnitude
        if distance > state.radius then return end
        if state.wallCheck and not (featurePack and featurePack.state.aimTrackWalls) then
            local result = workspace:Raycast(camera.CFrame.Position, part.Position - camera.CFrame.Position, params)
            if result and not result.Instance:IsDescendantOf(character) then return end
        end
        return part, distance
    end
    local function track(camera, dt)
        if (aimSuppressed and aimSuppressed()) or not state.aimlock or Input:GetFocusedTextBox()
            or (featurePack and not featurePack:allowsAim())
            or (state.holdRightMouse and not Input:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) then
            lockedPlayer = nil
            return
        end
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        local excluded = { camera }
        if player.Character then table.insert(excluded, player.Character) end
        params.FilterDescendantsInstances = excluded
        if featurePack and featurePack.state.aimContinuous then lockedPlayer=nil end
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
        trackedPart=part
        if part then
            local origin = camera.CFrame.Position
            if (part.Position - origin).Magnitude > 0.001 then
                local position=featurePack and featurePack:prediction(part,featurePack.state.aimPrediction) or part.Position
                local goal=CFrame.lookAt(origin,position)
                camera.CFrame = featurePack and featurePack.state.aimInstant and goal or camera.CFrame:Lerp(goal, aimlockAlpha(state.smoothing, dt))
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
                for _,instance in actor.extras do instance.Visible=false end
            end
            warn(lastError)
        end
    end)
    local api = {}
    function api:setFeaturePack(value) featurePack=value end
    function api:setAimSuppressed(callback) aimSuppressed=callback end
    function api:getLockTarget()
        local camera=workspace.CurrentCamera
        if not alive or not state.aimlock or not lockedPlayer or not camera or not trackedPart or not trackedPart.Parent then return end
        local humanoid=lockedPlayer.Character and lockedPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health<=0 then return end
        return trackedPart
    end
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
                if name and not path:gsub("\\", "/"):find("/_meta/",1,true)
                    and #name <= 40 and name:match("^[%w_-]+$") then table.insert(names, name) end
            end
        else
            for name in session do table.insert(names, name) end
        end
        table.sort(names)
        return names
    end
    function store:setAutoload(name)
        if name ~= nil then nameCheck(name) self:load(name) end
        if persistent then
            ensureDirectory()
            local meta=directory.."/_meta"
            if not fs.isfolder(meta) then fs.makefolder(meta) end
            local path=meta.."/autoload.json"
            if name then fs.writefile(path,json.encode({version=1,scope=scope,name=name}))
            elseif fs.isfile(path) then fs.delfile(path) end
        else
            memory.__autoload=memory.__autoload or {}
            memory.__autoload[scope]=name
        end
    end
    function store:getAutoload()
        if persistent then
            local path=directory.."/_meta/autoload.json"
            if not fs.isfile(path) then return end
            local encoded=fs.readfile(path)
            assert(#encoded<=4096,"Autoload metadata is too large.")
            local decoded=json.decode(encoded)
            assert(type(decoded)=="table" and decoded.version==1 and decoded.scope==scope,"Invalid autoload metadata.")
            return nameCheck(decoded.name)
        end
        return memory.__autoload and memory.__autoload[scope]
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
    assert(value.hitPart == "Random" or value.hitPart == "Head" or value.hitPart == "Body" or value.hitPart == "Closest", "Invalid hit part.")
    result.hitPart = value.hitPart
    return result
end


local function installConfigUI(window, Rayfield, store, capture, prepare)
    local tab = window:CreateTab("Configs", 4483362458)
    local mode = store.persistent and ("Files: " .. store.directory)
        or "Session only: this executor does not provide all required file APIs."
    tab:CreateLabel(mode)
    local status = tab:CreateLabel("Choose a name, then Save. Load restores all saved settings.")
    local autoloadLabel=tab:CreateLabel("Autoload: none")
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
        if store:getAutoload()==deletedName then store:setAutoload(nil) autoloadLabel:Set("Autoload: none") end
        status:Set("Deleted " .. deletedName .. ".")
        refresh()
    end) })
    tab:CreateButton({ Name = "Refresh config list", Callback = run(function() refresh(name) end) })
    tab:CreateButton({Name="Set selected config as autoload",Callback=run(function()
        prepare(store:load(name))
        store:setAutoload(name)
        autoloadLabel:Set("Autoload: "..name)
    end)})
    tab:CreateButton({Name="Remove autoload",Callback=run(function()
        store:setAutoload(nil) autoloadLabel:Set("Autoload: none")
    end)})
    run(function()autoloadLabel:Set("Autoload: "..(store:getAutoload() or "none"))end)()
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

        local cosmeticTypes={ "Skin", "Wrap", "Charm", "Finisher" }
        local enumKeys={ Skin=skinKey }
        for _,kind in { "Wrap", "Charm", "Finisher" } do
            local ok,key=pcall(function()return replicatedClass:ToEnum(kind)end)
            if ok then enumKeys[kind]=key end
        end
        local globalCatalog={ Wrap={}, Charm={}, Finisher={} }
        local catalog, weapons = {}, {}
        for name, info in pairs(cosmetics.Cosmetics) do
            if type(name)=="string" and type(info)=="table" and globalCatalog[info.Type] and not name:find("MISSING_",1,true) then
                table.insert(globalCatalog[info.Type],name)
            end
            if type(name) == "string" and type(info) == "table" and info.Type == "Skin"
                and type(info.ItemName) == "string" and not name:find("MISSING_", 1, true) then
                if not catalog[info.ItemName] then
                    catalog[info.ItemName] = {}
                    table.insert(weapons, info.ItemName)
                end
                table.insert(catalog[info.ItemName], name)
            end
        end
        for _,list in pairs(globalCatalog) do table.sort(list) end
        table.sort(weapons)
        assert(#weapons > 0, "No weapon skins with Type=Skin and ItemName were found.")
        for _, list in pairs(catalog) do table.sort(list) end
        local function skinData(name)
            local record = table.clone(assert(cosmetics.Cosmetics[name], "Unknown skin: " .. name))
            record.Name = name
            record.Type = record.Type or "Skin"
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
            if selected.skin ~= nil then
                local field=key=="Data" and "Skin" or skinKey
                data[field]=selected.skin and table.clone(selected.skin) or nil
                if replaceName then data[key=="Data" and "Name" or nameKey]=selected.skin and selected.skin.Name or weapon end
            end
            for _,kind in { "Wrap", "Charm", "Finisher" } do
                if selected[kind]~=nil then
                    local field=key=="Data" and kind or assert(enumKeys[kind],kind.." enum unavailable")
                    data[field]=selected[kind] and table.clone(selected[kind]) or nil
                end
            end
            return copy
        end
        patch(playerData, "GetWeaponData", function(original)
            return function(self, weapon, ...)
                local result = table.pack(original(self, weapon, ...))
                local selected = selection(weapon)
                if selected and type(result[1]) == "table" then
                    result[1] = table.clone(result[1])
                    if selected.skin~=nil then result[1].Skin = selected.skin and table.clone(selected.skin) or nil end
                    for _,kind in { "Wrap", "Charm", "Finisher" } do
                        if selected[kind]~=nil then result[1][kind]=selected[kind] and table.clone(selected[kind]) or nil end
                    end
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

        for _,kind in { "Wrap", "Charm" } do
            local method="Get"..kind
            if type(viewModel[method])=="function" then
                patch(viewModel,method,function(original)
                    return function(self,...)
                        local item=self.ClientItem
                        local selected=localItem(item) and selection(item.Name)
                        if selected and selected[kind]~=nil then return selected[kind] or nil end
                        return original(self,...)
                    end
                end)
            end
        end
        local selectedWeapon, selectedSkin, selectedType = weapons[1], "Use equipped skin", "Skin"
        local skinDropdown
        local function skinOptions(weapon,kind)
            kind=kind or selectedType
            local list = { "Use equipped skin", "No skin", "Random" }
            for _, name in (kind=="Skin" and catalog[weapon] or globalCatalog[kind]) or {} do table.insert(list, name) end
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
        local typeWidget = tab:CreateDropdown({Name="Cosmetic type",Options=cosmeticTypes,CurrentOption={"Skin"},MultipleOptions=false,Flag="SC_Type",
            Callback=function(value)
                selectedType=type(value)=="table" and value[1] or value
                selectedSkin="Use equipped skin"
                if skinDropdown then skinDropdown:Refresh(skinOptions(selectedWeapon)) skinDropdown:Set({selectedSkin}) end
            end})
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
        skinDropdown = tab:CreateDropdown({ Name = "Skin / cosmetic", Options = skinOptions(selectedWeapon),
            CurrentOption = { selectedSkin }, MultipleOptions = false, Flag = "SC_Skin",
            Callback = function(value) selectedSkin = type(value) == "table" and value[1] or value end })
        local function apply()
            local name = selectedSkin
            local key=selectedType=="Skin" and "skin" or selectedType
            if not enumKeys[selectedType] then notify(selectedType.." is unavailable in this game's replicated schema.") return end
            local selected=overrides[selectedWeapon] or {}
            if name == "Use equipped skin" then
                selected[key]=nil
            elseif name == "No skin" then
                selected[key]=false
            else
                if name == "Random" then
                    local list=selectedType=="Skin" and catalog[selectedWeapon] or globalCatalog[selectedType]
                    if #list==0 then notify("No matching cosmetics found.") return end
                    name=list[math.random(1,#list)]
                end
                local info=cosmetics.Cosmetics[name]
                if not info or info.Type~=selectedType or (selectedType=="Skin" and info.ItemName~=selectedWeapon) then
                    notify("Select a compatible cosmetic.") return
                end
                selected[key]=skinData(name)
            end
            overrides[selectedWeapon]=next(selected) and selected or nil
            refreshNotice(selectedWeapon.." | "..selectedType..": "..tostring(name)..(enabled and "." or " (overrides disabled)."))
        end
        tab:CreateButton({ Name = "Apply selected cosmetic", Callback = apply })
        tab:CreateButton({ Name = "Apply a random cosmetic", Callback = function()
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
                selectedSkin = selectedSkin, selectedType=selectedType, overrides = {} }
            for weapon, selected in pairs(overrides) do
                local record={cosmetics={}}
                if selected.skin~=nil then record.name=selected.skin and selected.skin.Name or "" record.seed=selected.skin and selected.skin.Seed or nil end
                for _,kind in { "Wrap", "Charm", "Finisher" } do
                    if selected[kind]~=nil then record.cosmetics[kind]={name=selected[kind] and selected[kind].Name or "",seed=selected[kind] and selected[kind].Seed or nil} end
                end
                saved.overrides[weapon]=record
            end
            return saved
        end
        function configAPI:prepare(saved)
            assert(type(saved) == "table" and type(saved.enabled) == "boolean"
                and type(saved.overrides) == "table", "Invalid skin config.")
            local importedType=saved.selectedType or "Skin"
            assert(table.find(cosmeticTypes,importedType),"Invalid saved cosmetic type.")
            assert(type(saved.selectedWeapon) == "string" and catalog[saved.selectedWeapon], "Saved weapon is unavailable.")
            assert(type(saved.selectedSkin) == "string"
                and table.find(skinOptions(saved.selectedWeapon,importedType), saved.selectedSkin), "Saved skin selection is unavailable.")
            local staged = {}
            for weapon, record in pairs(saved.overrides) do
                assert(type(weapon)=="string" and catalog[weapon] and type(record)=="table","Invalid saved weapon override.")
                local selected={}
                local function decode(kind,entry)
                    assert(type(entry)=="table" and type(entry.name)=="string","Invalid saved cosmetic.")
                    assert(enumKeys[kind],"Saved cosmetic type is unavailable.")
                    if entry.name=="" then return false end
                    local info=cosmetics.Cosmetics[entry.name]
                    assert(info and info.Type==kind and (kind~="Skin" or info.ItemName==weapon),"Saved cosmetic unavailable for "..weapon)
                    assert(type(entry.seed)=="number" and entry.seed>=1 and entry.seed<=1000000 and entry.seed%1==0,"Invalid cosmetic seed.")
                    local data=skinData(entry.name) data.Seed=entry.seed return data
                end
                if record.name~=nil then selected.skin=decode("Skin",record) end
                assert(record.cosmetics==nil or type(record.cosmetics)=="table","Invalid saved cosmetic map.")
                for kind,entry in pairs(record.cosmetics or {}) do
                    assert(kind=="Wrap" or kind=="Charm" or kind=="Finisher","Unsupported saved cosmetic type.")
                    selected[kind]=decode(kind,entry)
                end
                if next(selected) then staged[weapon]=selected end
            end
            local savedEnabled, savedWeapon, savedSkin, savedType = saved.enabled, saved.selectedWeapon, saved.selectedSkin, importedType
            -- Validate the complete config before applying any overrides or changing controls.
            return function()
                table.clear(overrides)
                for weapon, selected in pairs(staged) do overrides[weapon] = selected end
                enabled = savedEnabled
                enableWidget:Set(savedEnabled)
                typeWidget:Set({savedType})
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


local function installFeaturePack(window, Rayfield, player, endpoints)
    local Players = game:GetService("Players")
    local Run = game:GetService("RunService")
    local Input = game:GetService("UserInputService")
    local RS = game:GetService("ReplicatedStorage")
    local Lighting = game:GetService("Lighting")
    local Http = game:GetService("HttpService")
    local Teleport = game:GetService("TeleportService")
    local state = validateExtras({})
    local widgets, tabs, connections, patches, groups = {}, {}, {}, {}, {}
    local owned=setmetatable({}, {__mode="k"})
    local alive, aimToggle, silentToggle = true, false, true
    local binding = "JewHubFeatures_" .. Http:GenerateGUID(false)
    local environment=type(getgenv)=="function" and getgenv() or _G
    local teleportScope=tostring(game.GameId).."_"..tostring(player.UserId)
    local teleportFlag="SandboxHubConfigs/"..teleportScope.."_teleport.txt"
    environment.__JewHubTeleportQueues=environment.__JewHubTeleportQueues or {}
    local problems, modules = {}, {}
    local api = { state = state, suspects = {} }
    local sticky, target, pathPoints, pathIndex = nil, nil, {}, 1
    local pathBusy, pathAt, automationAt, statsAt = false, 0, 0, 0
    local lastTrigger, lastMelee, lastAutomatic = 0, 0, 0
    local freePosition, freeYaw, freePitch
    local flyVelocity, flyGyro
    local speedSince, notified, friendIds = {}, {}, {}
    local lastNotice = {}
    local rootGui = Instance.new("ScreenGui")
    rootGui.Name = "JewHubFeatureVisuals"
    rootGui.IgnoreGuiInset = true
    rootGui.ResetOnSpawn = false
    rootGui.Parent = player:WaitForChild("PlayerGui")
    local statusTab = window:CreateTab("Feature Status", 4483362458)
    local statusLabel = statusTab:CreateLabel("Loading additional features…")
    local function notify(text)
        if not alive then return end
        Rayfield:Notify({ Title = "Jew Hub", Content = text, Duration = 6 })
    end
    local function problem(key, text)
        if not alive then return end
        problems[key] = tostring(text)
        local time = os.clock()
        if time - (lastNotice[key] or -math.huge) >= 10 then
            lastNotice[key] = time
            statusLabel:Set(key .. ": " .. tostring(text))
            warn("[Jew Hub] " .. key .. ": " .. tostring(text))
        end
    end
    local function safe(key, callback, ...)
        local result = table.pack(pcall(callback, ...))
        if not result[1] then problem(key, result[2]) return end
        return table.unpack(result, 2, result.n)
    end
    local function path(root, names)
        for _, name in names do root = root and root:FindFirstChild(name) end
        return root
    end
    local function load(key, root, names)
        local node = path(root, names)
        if not node then return end
        local ok, module = pcall(require, node)
        if ok and type(module) == "table" then modules[key] = module return module end
        problem(key, ok and "Module did not return a table" or module)
    end
    local fighter = load("Fighter", player.PlayerScripts, {"Controllers","FighterController"})
    local mechanics = load("Mechanics", player.PlayerScripts, {"Controllers","MechanicsController"})
    local itemLibrary = load("Items", RS, {"Modules","ItemLibrary"})
    local gun = load("Gun", player.PlayerScripts, {"Modules","ItemTypes","Gun"})
    local clientItem = load("ClientItem", player.PlayerScripts, {"Modules","ClientReplicatedClasses","ClientFighter","ClientItem"})
    local viewModel = load("Viewmodel", player.PlayerScripts, {"Modules","ClientReplicatedClasses","ClientFighter","ClientItem","ClientViewModel"})
    local cosmetics = load("Cosmetics", RS, {"Modules","CosmeticLibrary"})
    local playerData = load("PlayerData", player.PlayerScripts, {"Controllers","PlayerDataController"})
    local function override(group, object, key, value)
        local byObject = groups[group]
        if not byObject then byObject = setmetatable({}, {__mode="k"}) groups[group] = byObject end
        local record = byObject[object]
        if not record then record = {} byObject[object] = record end
        if not record[key] then record[key] = { original = object[key] } end
        object[key] = value
        record[key].last = value
    end
    local function restore(group)
        for object, properties in pairs(groups[group] or {}) do
            for key, record in pairs(properties) do
                pcall(function() if object[key] == record.last then object[key] = record.original end end)
            end
        end
        groups[group] = nil
    end
    local function patch(module, key, factory)
        if not module or type(module[key]) ~= "function" then return false end
        local original = module[key]
        local wrapper = factory(original)
        table.insert(patches, { module=module, key=key, original=original, wrapper=wrapper })
        module[key] = wrapper
        return true
    end
    local function localFighter()
        return fighter and ((fighter.GetFighter and fighter:GetFighter(player)) or fighter.LocalFighter)
    end
    local function getRoot(character) return character and character:FindFirstChild("HumanoidRootPart") end
    local function team(other)
        if other == player then return true end
        local character=other.Character
        if character and (character:GetAttribute("IsAlly")==true or character:FindFirstChild("TeammateLabel",true) or character:FindFirstChild("AllyLabel",true)) then return true end
        local a, b = player:GetAttribute("TeamID"), other:GetAttribute("TeamID")
        if a ~= nil and b ~= nil then return a == b end
        return not player.Neutral and not other.Neutral and player.Team ~= nil and other.Team == player.Team
    end
    function api:qualifies(other, part)
        local character = other and other.Character
        if not character or not part then return false end
        if state.vulnerable and (character:FindFirstChildOfClass("ForceField") or character:GetAttribute("SpawnImmunity")) then return false end
        if state.ignoreShield and (character:GetAttribute("Shielded") or character:FindFirstChild("Shield") or character:FindFirstChild("EnergyShield")) then return false end
        if state.ignoreDeflect then
            if character:GetAttribute("Deflecting") or character:FindFirstChild("Deflect") or character:FindFirstChild("KatanaDeflect") then return false end
            local fo = fighter and fighter.GetFighter and fighter:GetFighter(other)
            local item = fo and fo.EquippedItem
            if item and item.ViewModel and item.ViewModel.Name == "Katana" and type(item._attack_cooldown)=="number"
                and item._attack_cooldown > tick() then return false end
        end
        local root, mine = getRoot(character), getRoot(player.Character)
        return root ~= nil and mine ~= nil and (root.Position - mine.Position).Magnitude <= state.maxDistance
    end
    local function visible(part)
        local camera = workspace.CurrentCamera
        if not camera then return false end
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = player.Character and {player.Character,camera} or {camera}
        local hit = workspace:Raycast(camera.CFrame.Position, part.Position-camera.CFrame.Position, params)
        return not hit or hit.Instance:IsDescendantOf(part:FindFirstAncestorOfClass("Model"))
    end
    local function partFor(character, mode, camera)
        local head = character:FindFirstChild("PhysicalHitboxHead",true) or character:FindFirstChild("HitboxHead",true)
            or character:FindFirstChild("Head",true)
        local body = character:FindFirstChild("UpperTorso",true) or character:FindFirstChild("Torso",true) or getRoot(character)
        if mode == "Body" then return body or head end
        if mode == "Closest" and head and body then
            local h,hOn = camera:WorldToViewportPoint(head.Position)
            local b,bOn = camera:WorldToViewportPoint(body.Position)
            if bOn and (not hOn or (Vector2.new(b.X,b.Y)-camera.ViewportSize/2).Magnitude < (Vector2.new(h.X,h.Y)-camera.ViewportSize/2).Magnitude) then return body end
        end
        return head or body
    end
    function api:selectSilent(config)
        local camera = workspace.CurrentCamera
        if not camera then return end
        local function evaluate(other)
            if other == player or (config.teamCheck and team(other)) then return end
            local character = other.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 then return end
            local part = partFor(character, config.hitPart, camera)
            if not self:qualifies(other, part) then return end
            local point,onScreen = camera:WorldToViewportPoint(part.Position)
            local cross = (Vector2.new(point.X,point.Y)-camera.ViewportSize/2).Magnitude
            if not onScreen or point.Z <= 0 or cross > config.radius or (config.wallCheck and not visible(part)) then return end
            local mine = getRoot(player.Character)
            local score = state.silentPriority=="Health" and humanoid.Health
                or (state.silentPriority=="Distance" and (part.Position-mine.Position).Magnitude or cross)
            if state.healthLead then score += humanoid.Health*0.15 end
            if state.ragePriority then score -= (humanoid.MaxHealth-humanoid.Health)*0.5 end
            return part,score
        end
        if state.silentSticky and sticky then
            local part=evaluate(sticky)
            if part then return part end
        end
        local best,bestScore,bestPlayer=nil,math.huge,nil
        for _,other in Players:GetPlayers() do
            local part,score=evaluate(other)
            if part and score<bestScore then best,bestScore,bestPlayer=part,score,other end
        end
        sticky=bestPlayer
        return best
    end
    function api:prediction(part, seconds)
        return part.Position + part.AssemblyLinearVelocity * seconds
    end
    function api:allowsAim()
        if state.freecam then return false end
        if state.aimMode=="Hold" and not Input:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and not Input:IsKeyDown(Enum.KeyCode.E) then return false end
        if state.aimMode=="Toggle" and not aimToggle then return false end
        local camera=workspace.CurrentCamera
        if state.aimScope and not Input:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and (not camera or camera.FieldOfView>=70) then return false end
        if state.aimReload then
            local lf=localFighter()
            local item=lf and lf.EquippedItem
            if (player.Character and player.Character:GetAttribute("Reloading")) or (item and item.Get and item:Get("IsReloading")) then return false end
        end
        return true
    end
    function api:allowsSilent()
        if state.silentMode=="Hold" then return Input:IsKeyDown(Enum.KeyCode.C) end
        return state.silentMode~="Toggle" or silentToggle
    end
    function api:getTarget()
        local part
        if endpoints.rage then local _,found=endpoints.rage:getTarget() part=found end
        if part then return part end
        part=endpoints.visual and endpoints.visual:getLockTarget()
        if part then return part end
        return target
    end
    local function inputAction(action)
        if not mechanics or type(mechanics.EquippedItemInput)~="function" then
            problem("Weapon input","MechanicsController.EquippedItemInput is unavailable") return
        end
        mechanics:EquippedItemInput(action)
    end
    local function cooldown()
        local lf=localFighter()
        local item=lf and lf.EquippedItem
        return math.max(0.02, item and item.Info and tonumber(item.Info.ShootCooldown) or 0.12)
    end
    local function restoreMovement()
        for _,name in {"speed","jump","noclip","fly","freecam","thirdPerson"} do restore(name) end
        if flyVelocity then flyVelocity:Destroy() flyVelocity=nil end
        if flyGyro then flyGyro:Destroy() flyGyro=nil end
    end
    local function directional(camera, flat)
        local cf=camera.CFrame
        local direction=Vector3.zero
        if Input:IsKeyDown(Enum.KeyCode.W) then direction+=cf.LookVector end
        if Input:IsKeyDown(Enum.KeyCode.S) then direction-=cf.LookVector end
        if Input:IsKeyDown(Enum.KeyCode.D) then direction+=cf.RightVector end
        if Input:IsKeyDown(Enum.KeyCode.A) then direction-=cf.RightVector end
        if flat then direction=Vector3.new(direction.X,0,direction.Z) end
        if Input:IsKeyDown(Enum.KeyCode.Space) then direction+=Vector3.yAxis end
        if Input:IsKeyDown(Enum.KeyCode.LeftControl) or Input:IsKeyDown(Enum.KeyCode.LeftShift) then direction-=Vector3.yAxis end
        return direction.Magnitude>0 and direction.Unit or direction
    end
    local function movement(dt, root, humanoid, camera)
        if state.speed then override("speed",humanoid,"WalkSpeed",state.walkSpeed) else restore("speed") end
        if state.jump then
            override("jump",humanoid,"UseJumpPower",true)
            override("jump",humanoid,"JumpPower",state.jumpPower)
        else restore("jump") end
        if state.noclip then
            for _,part in player.Character:GetDescendants() do if part:IsA("BasePart") then override("noclip",part,"CanCollide",false) end end
        else restore("noclip") end
        if state.bhop and Input:IsKeyDown(Enum.KeyCode.Space) and humanoid.FloorMaterial~=Enum.Material.Air then humanoid.Jump=true end
        if state.fly then
            if flyVelocity and flyVelocity.Parent~=root then flyVelocity:Destroy() flyVelocity=nil end
            if flyGyro and flyGyro.Parent~=root then flyGyro:Destroy() flyGyro=nil end
            if not flyVelocity then
                flyVelocity=Instance.new("BodyVelocity") flyVelocity.MaxForce=Vector3.new(1e8,1e8,1e8) flyVelocity.Parent=root
                flyGyro=Instance.new("BodyGyro") flyGyro.MaxTorque=Vector3.new(1e8,1e8,1e8) flyGyro.P=90000 flyGyro.Parent=root
            end
            override("fly",humanoid,"PlatformStand",true)
            flyVelocity.Velocity=Input:GetFocusedTextBox() and Vector3.zero or directional(camera)*state.flySpeed
            flyGyro.CFrame=camera.CFrame
        else
            if flyVelocity then flyVelocity:Destroy() flyVelocity=nil end
            if flyGyro then flyGyro:Destroy() flyGyro=nil end
            restore("fly")
        end
        if state.antiAim and not state.freecam and not (endpoints.rage and endpoints.rage:isActive()) then
            local angle=state.antiAimMode=="Jitter" and math.rad(math.random(-45,45)) or math.rad(state.spinSpeed*6*dt)
            if state.antiAimMode=="Backwards" then
                local flat=Vector3.new(camera.CFrame.LookVector.X,0,camera.CFrame.LookVector.Z)
                if flat.Magnitude>0.001 then root.CFrame=CFrame.lookAt(root.Position,root.Position-flat) end
            else root.CFrame*=CFrame.Angles(0,angle,0) end
        end
    end
    local function cameraStep(dt, root, camera)
        if state.cameraFOV then override("cameraFOV",camera,"FieldOfView",state.fov) else restore("cameraFOV") end
        if state.freecam then
            if not freePosition then
                freePosition=camera.CFrame.Position
                freePitch,freeYaw=camera.CFrame:ToOrientation()
            end
            override("freecam",camera,"CameraType",Enum.CameraType.Scriptable)
            if root then override("freecam",root,"Anchored",true) end
            local menuOpen=Rayfield:IsVisible()
            override("freecam",Input,"MouseBehavior",menuOpen and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCurrentPosition)
            if not Input:GetFocusedTextBox() and not menuOpen then
                local delta=Input:GetMouseDelta()
                freeYaw-=math.rad(delta.X*0.25)
                freePitch=math.clamp(freePitch-math.rad(delta.Y*0.25),math.rad(-89),math.rad(89))
                freePosition+=directional(camera)*state.freeSpeed*dt
            end
            camera.CFrame=CFrame.new(freePosition)*CFrame.Angles(0,freeYaw,0)*CFrame.Angles(freePitch,0,0)
        else freePosition=nil restore("freecam") end
        if state.thirdPerson and root and not state.freecam then
            local head=player.Character:FindFirstChild("Head") or root
            local origin=head.Position+Vector3.new(0,0.5,0)
            local direction=-camera.CFrame.LookVector*state.thirdDistance
            local params=RaycastParams.new() params.FilterType=Enum.RaycastFilterType.Exclude params.FilterDescendantsInstances={player.Character,camera}
            local hit=workspace:Raycast(origin,direction,params)
            local position=hit and hit.Position+hit.Normal*0.4 or origin+direction
            camera.CFrame=CFrame.lookAt(position,origin+camera.CFrame.LookVector*100)
        end
        if (state.thirdPerson or state.freecam) and player.Character then
            for _,part in player.Character:GetDescendants() do if part:IsA("BasePart") then override("thirdPerson",part,"LocalTransparencyModifier",0) end end
        else restore("thirdPerson") end
    end
    local function lightingStep()
        if state.fullbright then
            override("lighting",Lighting,"Brightness",2)
            override("lighting",Lighting,"ClockTime",14)
            override("lighting",Lighting,"GlobalShadows",false)
            override("lighting",Lighting,"OutdoorAmbient",Color3.fromRGB(150,150,150))
        else restore("lighting") end
        if state.noFog then
            override("fog",Lighting,"FogEnd",1000000)
            for _,child in Lighting:GetChildren() do if child:IsA("Atmosphere") then override("fog",child,"Density",0) end end
        else restore("fog") end
    end
    local originalStats=setmetatable({}, {__mode="k"})
    local function weaponStats()
        if not itemLibrary or type(itemLibrary.Items)~="table" then
            if state.noRecoil or state.noSpread or state.fastReload or state.rapidFire or state.instantEquip or state.infiniteAmmo then
                problem("Gun mods","ReplicatedStorage.Modules.ItemLibrary.Items is unavailable")
            end
            return
        end
        local flags={ShootRecoil="noRecoil",ShootSpread="noSpread",AimSpreadMultiplier="noSpread",
            ShootSpreadPerVelocityUnit="noSpread",ShootSpreadPerVelocityLimit="noSpread",
            EquipCooldown="instantEquip",ReloadLength="fastReload",EmptyReloadLength="fastReload",
            ReloadActionTimestamp="fastReload",EmptyReloadActionTimestamp="fastReload",ShootCooldown="rapidFire",
            MaxAmmo="infiniteAmmo",MaxAmmoReserve="infiniteAmmo"}
        for _,item in pairs(itemLibrary.Items) do
            if type(item)=="table" then
                for key,flag in pairs(flags) do
                    if type(item[key])=="number" then
                        local original=originalStats[item]
                        if not original then original={} originalStats[item]=original end
                        if original[key]==nil then original[key]=item[key] end
                        local value=original[key]
                        if state[flag] then
                            if flag=="rapidFire" then value=math.max(0.02,value*0.4)
                            elseif flag=="infiniteAmmo" then value=9999
                            elseif flag=="fastReload" or flag=="instantEquip" then value=0.05
                            else value=0 end
                            override("weaponStats_"..key,item,key,value)
                        else restore("weaponStats_"..key) end
                    end
                end
            end
        end
    end
    local function inputFeatures(time, root, camera)
        if Input:GetFocusedTextBox() or state.freecam or (endpoints.rage and endpoints.rage:isActive()) then return end
        if state.flick and (Input.TouchEnabled or Input:IsKeyDown(Enum.KeyCode.F)) then
            local config=endpoints.getAimConfig()
            local part=api:selectSilent(config)
            if part then camera.CFrame=CFrame.lookAt(camera.CFrame.Position,api:prediction(part,state.silentPrediction)) end
        end
        if state.trigger and time-lastTrigger>=math.max(state.triggerDelay/1000,cooldown()) then
            local params=RaycastParams.new() params.FilterType=Enum.RaycastFilterType.Exclude params.FilterDescendantsInstances={player.Character,camera}
            local hit=workspace:Raycast(camera.CFrame.Position,camera.CFrame.LookVector*state.maxDistance,params)
            if hit then
                local character=hit.Instance:FindFirstAncestorOfClass("Model")
                local other=character and Players:GetPlayerFromCharacter(character)
                local humanoid=character and character:FindFirstChildOfClass("Humanoid")
                if other and not team(other) and humanoid and humanoid.Health>0 and api:qualifies(other,hit.Instance) then
                    inputAction("FinishShooting") inputAction("StartShooting") lastTrigger=time
                end
            end
        end
        if state.automatic and Input:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and time-lastAutomatic>=cooldown() then
            inputAction("FinishShooting") inputAction("StartShooting") lastAutomatic=time
        end
        if (state.meleeAura or state.knifeRage) and time-lastMelee>=0.2 then
            local best,distance=nil,state.meleeRange+(state.extendMelee and 6 or 0)
            for _,other in Players:GetPlayers() do
                local r=getRoot(other.Character)
                local h=other.Character and other.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health>0 and not team(other) and (r.Position-root.Position).Magnitude<distance then best,distance=r,(r.Position-root.Position).Magnitude end
            end
            if best then
                local lf=localFighter()
                local melee=lf and lf.Items and lf.Items[3]
                if not melee then problem("Melee","No melee item is available in slot 3") return end
                if lf.EquippedItem~=melee then lf:EquipItem(3) lastMelee=time return end
                camera.CFrame=CFrame.lookAt(camera.CFrame.Position,best.Position)
                inputAction(state.backstab and "StartAiming" or "StartShooting")
                lastMelee=time
            end
        end
    end
    local viewPivots=setmetatable({}, {__mode="k"})
    local function viewmodelStep(camera)
        local folder=workspace:FindFirstChild("ViewModels")
        local first=folder and folder:FindFirstChild("FirstPerson")
        if not first then
            for _,child in camera:GetChildren() do if child:IsA("Model") then first=child break end end
        end
        local appearance=state.rainbow or state.weaponChams or state.hideWeapon
        if first and appearance then
            for _,part in first:GetDescendants() do
                if part:IsA("BasePart") then
                    if state.hideWeapon then override("viewHide",part,"LocalTransparencyModifier",1) end
                    if state.rainbow or state.weaponChams then
                        override("viewColor",part,"Color",state.weaponChams and Color3.fromRGB(226,120,152) or Color3.fromHSV(os.clock()*0.4%1,0.8,1))
                    end
                    if state.weaponChams then override("viewMaterial",part,"Material",Enum.Material.Neon) end
                end
            end
        end
        if not state.hideWeapon then restore("viewHide") end
        if not state.rainbow and not state.weaponChams then restore("viewColor") end
        if not state.weaponChams then restore("viewMaterial") end
        local offsetActive=state.viewX~=0 or state.viewY~=0 or state.viewZ~=0 or state.viewZoom
        local models={}
        if first then
            if first:IsA("Model") then table.insert(models,first)
            else for _,child in first:GetChildren() do if child:IsA("Model") then table.insert(models,child) end end end
        end
        for _,model in models do
            local current=model:GetPivot()
            local previous=viewPivots[model]
            local base=previous and current==previous.applied and previous.base or current
            if offsetActive then
                -- Models share the world camera: use local Z offset as a zoom approximation.
                local zoom=state.viewZoom and (70-state.viewFOV)/30 or 0
                local applied=camera.CFrame*CFrame.new(state.viewX,state.viewY,state.viewZ+zoom)*camera.CFrame:ToObjectSpace(base)
                model:PivotTo(applied) viewPivots[model]={base=base,applied=applied}
            elseif previous then
                if current==previous.applied then model:PivotTo(previous.base) end
                viewPivots[model]=nil
            end
        end
    end
    local soundIds={Skeet="rbxassetid://4817809188",Rust="rbxassetid://1255040462",Ding="rbxassetid://9114223175"}
    local lastSound=0
    local function hitSound()
        if not alive or state.hitSound=="Off" or os.clock()-lastSound<0.04 then return end
        lastSound=os.clock()
        local sound=Instance.new("Sound") sound.SoundId=soundIds[state.hitSound] sound.Volume=0.7
        sound.Parent=game:GetService("SoundService") sound:Play()
        owned[sound]=true
        game:GetService("Debris"):AddItem(sound,2)
    end
    local feedback=patch(clientItem,"_PlayHitmarkerQueue",function(original)
        return function(self,...)
            local owner=self.ClientFighter or self.Fighter or self._fighter
            if owner and owner.Player==player then safe("Hit sound",hitSound) end
            return original(self,...)
        end
    end)
    local crosshair=load("Hit feedback",player.PlayerScripts,{"Modules","ClientReplicatedClasses","ClientFighter","ClientItem","ItemInterface","Mouse","MouseCrosshair"})
    feedback=patch(crosshair,"DamageEffect",function(original)
        return function(self,...) safe("Hit sound",hitSound) return original(self,...) end
    end) or feedback
    patch(viewModel,"ApplyRecoil",function(original)
        return function(self,...) if alive and (state.noRecoil or state.antiShake) then return end return original(self,...) end
    end)
    function api:onShot(origin,destination)
        if not alive or not state.bulletTracers or (destination-origin).Magnitude<0.01 then return end
        local p=Instance.new("Part") p.Name="JewHubShotTracer" p.Anchored=true p.CanCollide=false p.CanTouch=false p.CanQuery=false
        p.Material=Enum.Material.Neon p.Color=Color3.fromRGB(226,120,152)
        p.Size=Vector3.new(0.05,0.05,(destination-origin).Magnitude)
        p.CFrame=CFrame.lookAt((origin+destination)/2,destination) p.Parent=workspace
        owned[p]=true game:GetService("Debris"):AddItem(p,0.35)
    end
    patch(gun,"_LocalTracers",function(original)
        return function(self,...)
            if state.bulletTracers then safe("Shot tracers",function()
                local camera=workspace.CurrentCamera
                local params=RaycastParams.new() params.FilterType=Enum.RaycastFilterType.Exclude params.FilterDescendantsInstances={player.Character,camera}
                local hit=workspace:Raycast(camera.CFrame.Position,camera.CFrame.LookVector*1000,params)
                api:onShot(camera.CFrame.Position,hit and hit.Position or camera.CFrame.Position+camera.CFrame.LookVector*1000)
            end) end
            return original(self,...)
        end
    end)
    local hud=Instance.new("TextLabel") hud.Size=UDim2.fromOffset(350,50) hud.Position=UDim2.new(0.5,-175,1,-100)
    hud.BackgroundColor3=Color3.fromRGB(20,20,28) hud.TextColor3=Color3.new(1,1,1) hud.TextSize=15 hud.TextWrapped=true hud.Visible=false hud.Parent=rootGui
    local watermark=Instance.new("TextLabel") watermark.Size=UDim2.fromOffset(340,24) watermark.Position=UDim2.new(1,-350,0,8)
    watermark.BackgroundColor3=Color3.fromRGB(20,20,28) watermark.TextColor3=Color3.fromRGB(226,120,152) watermark.TextSize=13 watermark.Parent=rootGui
    local fpsFrames,fpsAt=0,os.clock()
    local pathFolder=Instance.new("Folder") pathFolder.Name="JewHubTargetPath" pathFolder.Parent=workspace owned[pathFolder]=true
    local lines,arrows={},{}
    local function pathPart(list,index)
        if list[index] then return list[index] end
        local part=Instance.new("Part") part.Anchored=true part.CanCollide=false part.CanTouch=false part.CanQuery=false
        part.Material=Enum.Material.Neon part.Color=Color3.fromRGB(226,120,152) part.Transparency=1 part.Parent=pathFolder
        list[index]=part return part
    end
    local function closestWorld(root)
        local best,distance=nil,state.maxDistance
        for _,other in Players:GetPlayers() do
            local character=other.Character
            local r=getRoot(character)
            local h=character and character:FindFirstChildOfClass("Humanoid")
            if r and h and h.Health>0 and not team(other) and api:qualifies(other,r) and (r.Position-root.Position).Magnitude<distance then
                best=character:FindFirstChild("Head") or r distance=(r.Position-root.Position).Magnitude
            end
        end
        return best
    end
    local lastMovePosition,stuckTime=nil,0
    local lastAutoplayShot=0
    local moved=false
    local function targetMovement(dt,root,humanoid)
        local part=api:getTarget()
        local rageActive=endpoints.rage and endpoints.rage:isActive()
        local pointBlank=rageActive and endpoints.rage:export().pointBlank
        if state.freecam or Input:GetFocusedTextBox() or pointBlank then
            if moved then humanoid:Move(Vector3.zero,false) moved=false end
            return
        end
        if state.strafe and rageActive and part then
            local angle=os.clock()*state.strafeSpeed
            local goal=part.Position+Vector3.new(math.cos(angle)*state.strafeRadius,0,math.sin(angle)*state.strafeRadius)
            local delta=Vector3.new(goal.X-root.Position.X,0,goal.Z-root.Position.Z)
            humanoid:Move(delta.Magnitude>0.5 and delta.Unit or Vector3.zero,false) moved=true
        elseif state.autoplay and part then
            local camera=workspace.CurrentCamera
            if camera then
                camera.CFrame=CFrame.lookAt(camera.CFrame.Position,part.Position)
                local time=os.clock()
                if state.autoShoot and visible(part) and time-lastAutoplayShot>=cooldown() then
                    inputAction("FinishShooting") inputAction("StartShooting") lastAutoplayShot=time
                end
            end
            if (part.Position-root.Position).Magnitude>state.stopDistance then
                local waypoint=pathPoints[pathIndex]
                if waypoint and (Vector3.new(waypoint.Position.X,root.Position.Y,waypoint.Position.Z)-root.Position).Magnitude<4 then
                    pathIndex=math.min(pathIndex+1,#pathPoints) waypoint=pathPoints[pathIndex]
                end
                local position=waypoint and waypoint.Position or part.Position
                local delta=Vector3.new(position.X-root.Position.X,0,position.Z-root.Position.Z)
                humanoid:Move(delta.Magnitude>0.5 and delta.Unit or Vector3.zero,false) moved=true
                if waypoint and waypoint.Action==Enum.PathWaypointAction.Jump then humanoid.Jump=true end
                if lastMovePosition and (root.Position-lastMovePosition).Magnitude<0.02 then stuckTime+=dt else stuckTime=0 end
                lastMovePosition=root.Position
                if stuckTime>0.35 then humanoid.Jump=true stuckTime=0 end
            elseif moved then humanoid:Move(Vector3.zero,false) moved=false end
        elseif moved then humanoid:Move(Vector3.zero,false) moved=false end
    end
    local function updatePath(root,part,time)
        if pathBusy or time-pathAt<0.5 then return end
        pathAt=time
        if not part or not (state.autoplay or (state.targetVisuals and state.targetPath)) then pathPoints={} return end
        pathBusy=true
        local from,to=root.Position,part.Position
        task.spawn(function()
            local ok,points=pcall(function()
                local path=game:GetService("PathfindingService"):CreatePath({AgentRadius=2,AgentHeight=5,AgentCanJump=true,WaypointSpacing=4})
                path:ComputeAsync(from,to)
                if path.Status==Enum.PathStatus.Success then return path:GetWaypoints() end
                return {{Position=from},{Position=to}}
            end)
            if alive and ok then pathPoints=points pathIndex=math.min(2,#points) end
            pathBusy=false
        end)
    end
    local function targetDisplay(root,time)
        local part=api:getTarget()
        local character=part and part:FindFirstAncestorOfClass("Model")
        local humanoid=character and character:FindFirstChildOfClass("Humanoid")
        hud.Visible=not not (state.targetVisuals and state.targetHUD and humanoid and humanoid.Health>0)
        if hud.Visible then
            local other=Players:GetPlayerFromCharacter(character)
            hud.Text=string.format("%s  |  %d/%d HP  |  %.0f studs",other and other.DisplayName or character.Name,humanoid.Health,humanoid.MaxHealth,(part.Position-root.Position).Magnitude)
        end
        local show=state.targetVisuals and state.targetPath and part and #pathPoints>=2
        for _,line in lines do line.Transparency=1 end
        for _,arrow in arrows do arrow.Transparency=1 end
        if not show then return end
        local segments,total={},0
        local rayParams=RaycastParams.new() rayParams.FilterType=Enum.RaycastFilterType.Exclude rayParams.FilterDescendantsInstances={player.Character,pathFolder}
        for index=1,math.min(#pathPoints-1,24) do
            local a,b=pathPoints[index].Position,pathPoints[index+1].Position
            local hA=workspace:Raycast(a+Vector3.new(0,3,0),Vector3.new(0,-10,0),rayParams)
            local hB=workspace:Raycast(b+Vector3.new(0,3,0),Vector3.new(0,-10,0),rayParams)
            a=hA and hA.Position+Vector3.new(0,0.1,0) or a
            b=hB and hB.Position+Vector3.new(0,0.1,0) or b
            local distance=(b-a).Magnitude
            if distance>0.01 then
                local line=pathPart(lines,index) line.Size=Vector3.new(0.12,0.06,distance) line.CFrame=CFrame.lookAt((a+b)/2,b) line.Transparency=0
                table.insert(segments,{a=a,b=b,length=distance,start=total}) total+=distance
            end
        end
        local offset=time*state.arrowSpeed%state.arrowSpacing
        for index=1,math.min(16,math.floor(total/state.arrowSpacing)) do
            local travel=(index-1)*state.arrowSpacing+offset
            for _,segment in segments do
                if travel>=segment.start and travel<=segment.start+segment.length then
                    local position=segment.a:Lerp(segment.b,(travel-segment.start)/segment.length)
                    local base=CFrame.lookAt(position,position+segment.b-segment.a)
                    for side=1,2 do
                        local arrow=pathPart(arrows,index*2-2+side)
                        arrow.Size=Vector3.new(0.12,0.06,1)
                        arrow.CFrame=base*CFrame.Angles(0,math.rad(side==1 and -140 or 140),0)*CFrame.new(0,0,0.5)
                        arrow.Transparency=0
                    end
                    break
                end
            end
        end
    end
    local tripHighlights=setmetatable({}, {__mode="k"})
    local function tripmines()
        if state.espTripmines then
            for _,object in workspace:GetDescendants() do
                if object.Name:lower():find("tripmine",1,true) and (object:IsA("Model") or object:IsA("BasePart"))
                    and not (object.Parent and object.Parent.Name:lower():find("tripmine",1,true)) then
                    if not tripHighlights[object] then
                        local highlight=Instance.new("Highlight") highlight.Name="JewHubTripmine" highlight.Adornee=object
                        highlight.FillColor=Color3.fromRGB(255,80,80) highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop highlight.Parent=rootGui
                        tripHighlights[object]=highlight
                    end
                end
            end
        end
        for object,highlight in pairs(tripHighlights) do
            if not state.espTripmines or not object.Parent then highlight:Destroy() tripHighlights[object]=nil end
        end
    end
    local pendingCalls={}
    local function remoteCall(key,remote,...)
        if not remote then problem(key,"Expected game remote is unavailable") return end
        if remote:IsA("RemoteEvent") then remote:FireServer(...)
        elseif remote:IsA("RemoteFunction") and not pendingCalls[key] then
            pendingCalls[key]=true local args=table.pack(...)
            task.spawn(function() safe(key,function() remote:InvokeServer(table.unpack(args,1,args.n)) end) pendingCalls[key]=nil end)
        end
    end
    local function split(text)
        local result={}
        for value in text:gmatch("[^,]+") do table.insert(result,value:match("^%s*(.-)%s*$")) end
        return result
    end
    local function inventoryPreview()
        if not state.unlockInventory then restore("inventory") return end
        local data=playerData and playerData.CurrentData and playerData.CurrentData.Data
        if not data or not cosmetics or not cosmetics.Cosmetics then problem("Inventory preview","PlayerDataController/skin catalog is unavailable") return end
        local inventory=table.clone(data.CosmeticInventory or {})
        for name in pairs(cosmetics.Cosmetics) do inventory[name]=true end
        override("inventory",data,"CosmeticInventory",inventory)
        if itemLibrary and itemLibrary.Items then
            local weapons,seen={},{}
            for _,record in pairs(data.WeaponInventory or {}) do
                if type(record)=="table" and record.Name then table.insert(weapons,table.clone(record)) seen[record.Name]=true end
            end
            for name in pairs(itemLibrary.Items) do if not seen[name] then table.insert(weapons,{Name=name,Level=1,XP=0,IsFavorited=false}) end end
            override("inventory",data,"WeaponInventory",weapons)
        end
    end
    local function automation()
        local remotes=RS:FindFirstChild("Remotes")
        local duels=remotes and remotes:FindFirstChild("Duels")
        local matchmaking=remotes and remotes:FindFirstChild("Matchmaking")
        local h=player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if state.autoRespawn and (not h or h.Health<=0) then remoteCall("Respawn",duels and duels:FindFirstChild("RespawnNow")) end
        if state.autoQueue then remoteCall("Queue",matchmaking and matchmaking:FindFirstChild("JoinQueue"),state.queueMode) end
        if state.autoVote then remoteCall("Map voting",duels and duels:FindFirstChild("Vote"),"Map",split(state.maps)[1]) end
        if state.autoBan then
            local second=player:GetAttribute("BanRound")==2
            remoteCall("Weapon voting",duels and duels:FindFirstChild("Vote"),"Weapon",split(second and state.secondBans or state.bans)[1])
        end
        if state.autoLoadout then
            local map=workspace:GetAttribute("Map") or player:GetAttribute("Map")
            if not state.mapsOnly or state.enabledMaps=="All Maps" or (map and table.find(split(state.enabledMaps),tostring(map))) then
                remoteCall("Loadout",duels and duels:FindFirstChild("PickWeaponsAheadOfTime"))
            end
        end
        if state.autoPickup then
            local root=getRoot(player.Character)
            if type(firetouchinterest)~="function" then problem("Pickup","This executor does not support firetouchinterest")
            elseif root then
                for _,object in workspace:GetChildren() do
                    local name=object.Name:lower()
                    if name:find("drop") or name:find("ammo") or name:find("tripmine") then
                        local part=object:IsA("BasePart") and object or object:FindFirstChildWhichIsA("BasePart")
                        if part and (part.Position-root.Position).Magnitude<=state.pickupRange then firetouchinterest(root,part,0) firetouchinterest(root,part,1) end
                    end
                end
            end
        end
    end
    local detectorBusy=false
    local function detectors(time)
        if detectorBusy or not (state.speedDetector or state.modDetector) then return end
        detectorBusy=true
        task.spawn(function()
            safe("Detectors",function()
                for _,other in Players:GetPlayers() do
                    if not alive then return end
                    if other~=player then
                        local root=getRoot(other.Character)
                        if state.speedDetector and root and root.AssemblyLinearVelocity.Magnitude>state.speedThreshold then
                            speedSince[other]=speedSince[other] or time
                            if time-speedSince[other]>=state.speedDuration then
                                api.suspects[other]=true
                                if not notified[other] or time-notified[other]>12 then
                                    notified[other]=time
                                    if state.notifySpeed then notify("Unusual speed: "..other.DisplayName.." (movement alone is not proof of cheating)") end
                                    if state.loadOnDetect and endpoints.loadConfig then endpoints.loadConfig(state.detectProfile) end
                                end
                            end
                        else speedSince[other]=nil api.suspects[other]=nil end
                        if state.modDetector and not notified["staff_"..other.UserId] then
                            local match=false
                            for _,name in split(state.modNames) do if other.Name:lower()==name:lower() or other.DisplayName:lower()==name:lower() then match=true end end
                            local group=state.groupId
                            if group==0 and game.CreatorType==Enum.CreatorType.Group then group=game.CreatorId end
                            local rank=other:GetAttribute("GroupRank")
                            if rank==nil and group>0 then local ok,value=pcall(function()return other:GetRankInGroup(group)end) if ok then rank=value end end
                            if type(rank)=="number" and rank>=state.minRank then match=true end
                            for _,name in split(state.modFriends) do
                                if name~="" then
                                    if friendIds[name]==nil then local ok,id=pcall(function()return Players:GetUserIdFromNameAsync(name)end) friendIds[name]=ok and id or false end
                                    if friendIds[name] then local ok,value=pcall(function()return other:IsFriendsWith(friendIds[name])end) if ok and value then match=true end end
                                end
                            end
                            if match then
                                notified["staff_"..other.UserId]=true
                                if state.notifyMods then notify("Staff filter matched: "..other.Name) end
                            end
                        end
                    end
                end
            end)
            detectorBusy=false
        end)
    end
    local function cleanup()
        if not alive then return end
        alive=false
        if type(writefile)=="function" and type(isfile)=="function" and isfile(teleportFlag) then pcall(writefile,teleportFlag,"false") end
        Run:UnbindFromRenderStep(binding)
        for _,connection in connections do connection:Disconnect() end
        for index=#patches,1,-1 do local p=patches[index] if p.module[p.key]==p.wrapper then p.module[p.key]=p.original end end
        restoreMovement()
        local keys={} for name in pairs(groups) do table.insert(keys,name) end
        for _,name in keys do restore(name) end
        for model,pivot in pairs(viewPivots) do pcall(function()if model:GetPivot()==pivot.applied then model:PivotTo(pivot.base) end end) end
        for instance in pairs(owned) do pcall(function()instance:Destroy()end) end
        if moved then local h=player.Character and player.Character:FindFirstChildOfClass("Humanoid") if h then h:Move(Vector3.zero,false) end end
        rootGui:Destroy()
    end
    local onChange
    for _,entry in extraSchema do
        local where,key,label,default=entry[1],entry[2],entry[3],entry[4]
        if not tabs[where] then tabs[where]=window:CreateTab(where,4483362458) end
        local callback=function(value)
            if type(entry[5])=="table" then value=type(value)=="table" and value[1] or value end
            local candidate=table.clone(state) candidate[key]=value
            local validated=validateExtras(candidate)
            state[key]=validated[key]
            if onChange then onChange(key) end
        end
        local options={Name=label,Flag="EX_"..key,Callback=callback}
        if type(default)=="boolean" then options.CurrentValue=default widgets[key]=tabs[where]:CreateToggle(options)
        elseif type(default)=="number" then options.CurrentValue=default options.Range={entry[5],entry[6]} options.Increment=entry[7] widgets[key]=tabs[where]:CreateSlider(options)
        elseif type(entry[5])=="table" then options.CurrentOption={default} options.Options=entry[5] options.MultipleOptions=false widgets[key]=tabs[where]:CreateDropdown(options)
        else options.CurrentValue=default options.PlaceholderText=label options.RemoveTextAfterFocusLost=false widgets[key]=tabs[where]:CreateInput(options) end
    end
    tabs["Rage Extras"]:CreateLabel("Point-blank attacks take priority over orbiting and pathfinding. Use current-position attacks for orbit/autoplay.")
    tabs["Combat Extras"]:CreateLabel("Aimlock hold/toggle: RMB or E. Silent hold/toggle: C. Flickbot: hold F.")
    tabs["Gun Mods"]:CreateLabel("These change local stats and inputs. Server ammo, damage and cooldown checks still apply.")
    tabs["Viewmodel"]:CreateLabel("Weapons share the world camera. Zoom uses a local depth approximation rather than an independent camera FOV.")
    tabs["Cosmetic Preview"]:CreateLabel("Client inventory previews do not grant server ownership or purchases.")
    statusTab:CreateButton({Name="Show unavailable features",Callback=function()
        local messages={}
        for key,value in pairs(problems) do table.insert(messages,key..": "..value) end
        notify(#messages>0 and table.concat(messages,"\n") or "No runtime problems recorded yet.")
    end})
    tabs.Session:CreateButton({Name="Rejoin this server",Callback=function()
        safe("Rejoin",function()Teleport:TeleportToPlaceInstance(game.PlaceId,game.JobId,player)end)
    end})
    tabs.Session:CreateLabel("Account: "..player.Name.." | place: "..game.PlaceId)
    tabs.Session:CreateInput({Name="Find a feature",Flag="EX_Search",CurrentValue="",RemoveTextAfterFocusLost=false,PlaceholderText="e.g. recoil, strafe, health",
        Callback=function(query)
            query=tostring(query):lower()
            if query=="" then return end
            local matches={}
            for _,entry in extraSchema do
                if entry[3]:lower():find(query,1,true) or entry[1]:lower():find(query,1,true) then table.insert(matches,entry[1].." → "..entry[3]) end
                if #matches>=12 then break end
            end
            notify(#matches>0 and table.concat(matches,"\n") or "No additional setting matched. Base aim, ESP and skin settings have their own tabs.")
        end})
    tabs.Session:CreateButton({Name="Join lowest reported-ping public server",Callback=function()
        task.spawn(function() safe("Server search",function()
            local data=Http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&excludeFullGames=true&limit=100"))
            local best
            for _,server in data.data or {} do
                if server.id~=game.JobId and server.playing<server.maxPlayers and (not best or (server.ping or math.huge)<(best.ping or math.huge)) then best=server end
            end
            assert(best,"No other available server was returned")
            Teleport:TeleportToPlaceInstance(game.PlaceId,best.id,player)
        end) end)
    end})
    local teleportQueued=environment.__JewHubTeleportQueues[teleportScope]==true
    onChange=function(key)
        if key=="hitSound" and state.hitSound~="Off" and not feedback then problem("Hit sound","No supported local hit-feedback method was found") end
        if key=="resumeTeleport" then
            local queue=queue_on_teleport or (syn and syn.queue_on_teleport)
            if state.resumeTeleport and not teleportQueued then
                if type(queue)~="function" or type(readfile)~="function" or type(isfile)~="function" or type(writefile)~="function"
                    or type(makefolder)~="function" or type(isfolder)~="function" then
                    problem("Teleport reload","This feature requires queue_on_teleport and file read/write support")
                    widgets.resumeTeleport:Set(false) return
                end
                queue(string.format([[if not game:IsLoaded() then game.Loaded:Wait() end
local path=%q
if type(isfile)=="function" and type(readfile)=="function" and isfile(path) and readfile(path)=="true" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/lowqualityrobloxcheats/rivals-sandbox/refs/heads/main/SandboxHub-Rayfield.luau"))() end]],teleportFlag))
                teleportQueued=true
                environment.__JewHubTeleportQueues[teleportScope]=true
            end
            if type(writefile)=="function" and type(makefolder)=="function" and type(isfolder)=="function" then
                safe("Teleport setting",function()if not isfolder("SandboxHubConfigs")then makefolder("SandboxHubConfigs")end writefile(teleportFlag,tostring(state.resumeTeleport))end)
            end
        end
    end
    table.insert(connections,Input.InputBegan:Connect(function(input,processed)
        if processed or Input:GetFocusedTextBox() then return end
        if input.UserInputType==Enum.UserInputType.MouseButton2 or input.KeyCode==Enum.KeyCode.E then aimToggle=not aimToggle end
        if input.KeyCode==Enum.KeyCode.C then silentToggle=not silentToggle end
    end))
    table.insert(connections,Input.JumpRequest:Connect(function()
        if state.infiniteJump and alive then
            local h=player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if h and h.Health>0 then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end))
    table.insert(connections,Players.PlayerRemoving:Connect(function(other)
        api.suspects[other]=nil speedSince[other]=nil notified[other]=nil
        if sticky==other then sticky=nil end
    end))
    local engineBusy=false
    Run:BindToRenderStep(binding,Enum.RenderPriority.Last.Value+10,function(dt)
        if not alive or engineBusy then return end
        engineBusy=true
        safe("Feature frame",function()
            local camera=workspace.CurrentCamera
            local character=player.Character
            local root=getRoot(character)
            local humanoid=character and character:FindFirstChildOfClass("Humanoid")
            if not camera then return end
            local time=os.clock()
            watermark.Visible=state.watermark
            fpsFrames+=1
            if time-fpsAt>=0.5 then
                local ping="n/a"
                if type(player.GetNetworkPing)=="function" then local ok,value=pcall(function()return player:GetNetworkPing()end) if ok then ping=tostring(math.floor(value*1000+0.5)) end end
                watermark.Text=string.format("Jew Hub | %d FPS | %s ms | %d players",math.floor(fpsFrames/(time-fpsAt)+0.5),ping,#Players:GetPlayers())
                fpsFrames=0 fpsAt=time
            end
            if root and humanoid and humanoid.Health>0 then
                safe("Movement",movement,dt,root,humanoid,camera)
                target=closestWorld(root)
                safe("Inputs",inputFeatures,time,root,camera)
                safe("Autoplay movement",targetMovement,dt,root,humanoid)
                updatePath(root,api:getTarget(),time)
                safe("Target display",targetDisplay,root,time)
            else hud.Visible=false restoreMovement() end
            safe("Camera",cameraStep,dt,root,camera)
            safe("Viewmodel",viewmodelStep,camera)
            if time-statsAt>=0.5 then
                statsAt=time safe("Lighting",lightingStep) safe("Weapon stats",weaponStats)
            end
            if time-automationAt>=2 then
                automationAt=time safe("Automation",automation) safe("Inventory preview",inventoryPreview)
                safe("Tripmines",tripmines) detectors(time)
            end
        end)
        engineBusy=false
    end)
    function api:export() return validateExtras(state) end
    function api:prepare(saved)
        local validated=validateExtras(saved)
        return function()
            for _,entry in extraSchema do
                local key=entry[2]
                widgets[key]:Set(type(entry[5])=="table" and {validated[key]} or validated[key])
            end
        end
    end
    function api:setLoadConfig(callback) endpoints.loadConfig=callback end
    function api:getWeaponName(other)
        local fo=fighter and fighter.GetFighter and fighter:GetFighter(other)
        local item=fo and fo.EquippedItem
        if item then return item.Name end
        local tool=other.Character and other.Character:FindFirstChildOfClass("Tool")
        return tool and tool.Name
    end
    function api:isTeammate(other) return team(other) end
    function api:isInDuel()
        local lf=localFighter()
        if lf and type(lf.Get)=="function" then
            local value=lf:Get("IsInDuel")
            if type(value)=="boolean" then return value end
        end
        return player:GetAttribute("IsInDuel")
    end
    statusLabel:Set("Feature pack ready. Game-specific actions report missing modules/remotes here.")
    return cleanup,api
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
    local rageCleanup, rageConfig
    local featureCleanup, featureConfig
    local function cleanup()
        if not alive then return end
        alive = false
        if rageCleanup then rageCleanup() end
        if featureCleanup then featureCleanup() end
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
        Name = "Jew Hub", LoadingTitle = "Jew Hub",
        LoadingSubtitle = "Rayfield", Theme = "Ocean", ShowText = "Jew Hub",
        ToggleUIKeybind = "K", ConfigurationSaving = { Enabled = false },
        Discord = { Enabled = false }, KeySystem = false,
    })
    skinCleanup, skinConfig = installSkinChanger(window, Rayfield, player)
    visualCleanup, visualConfig = installVisualAim(window, Rayfield, player)
    rageCleanup, rageConfig = installRagebot(window, Rayfield, player)
    visualConfig:setAimSuppressed(function() return rageConfig and rageConfig:isActive() end)
    featureCleanup, featureConfig = installFeaturePack(window, Rayfield, player, {
        rage = rageConfig, visual = visualConfig,
        getAimConfig = function() return config end,
    })
    visualConfig:setFeaturePack(featureConfig)
    if rageConfig then rageConfig:setFeaturePack(featureConfig) end
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
    local hitPartWidget = tab:CreateDropdown({ Name = "Where to hit", Options = { "Random", "Head", "Body", "Closest" },
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
            if featureConfig then return featureConfig:selectSilent(config) end
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
            if rageConfig and rageConfig:hasShotOverride() then return end
            local lock = featureConfig.state.correctShots and visualConfig:getLockTarget() or nil
            local silentActive = config.enabled and featureConfig:allowsSilent()
            if not lock and (not silentActive or config.chance <= 0) then return end
            if not lock and config.chance < 100 and rng:NextNumber(0, 100) >= config.chance then return end
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not root or not root:IsA("BasePart") then return end
            local target = lock or chooseTarget(root.Position)
            if target and not lock and config.hitPart=="Random" then
                local character=target:FindFirstAncestorOfClass("Model")
                if character then
                    local head=character:FindFirstChild("PhysicalHitboxHead",true) or character:FindFirstChild("Head",true)
                    local body=character:FindFirstChild("UpperTorso",true) or character:FindFirstChild("Torso",true) or character:FindFirstChild("HumanoidRootPart",true)
                    target=rng:NextNumber(0,100)<featureConfig.state.headChance and (head or body) or (body or head)
                end
            end
            if not target then return end
            local cf = target.CFrame
            local position=featureConfig:prediction(target,lock and featureConfig.state.aimPrediction or featureConfig.state.silentPrediction)
            if (position-root.Position).Magnitude<0.001 then return end
            featureConfig:onShot(root.Position,position)
            args[4] = {
                [utf8.char(1)] = {
                    [utf8.char(0)] = utility:EncodeCFrame(CFrame.lookAt(root.Position, position)),
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
            visualAim = visualConfig:export(), ragebot = rageConfig and rageConfig:export() or nil, extras = featureConfig:export() }
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
        local commitRage
        if saved.ragebot ~= nil then
            assert(rageConfig, "Cannot load ragebot settings because its controller is unavailable.")
            commitRage = rageConfig:prepare(saved.ragebot)
        end
        local commitFeatures=featureConfig:prepare(saved.extras or {})
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
            if commitRage then commitRage() end
            commitFeatures()
            aimEnabledWidget:Set(aim.enabled)
        end
    end
    featureConfig:setLoadConfig(function(name)
        local commit=prepareConfig(configStore:load(name))
        commit()
    end)
    installConfigUI(window, Rayfield, configStore, captureConfig, prepareConfig)
    local initialConfig=captureConfig()
    local presetTab=window:CreateTab("Presets",4483362458)
    presetTab:CreateButton({Name="Create missing default / rage configs",Callback=function()
        local ok,message=pcall(function()
            local existing=configStore:list()
            if not table.find(existing,"default") then configStore:save("default",initialConfig) end
            if not table.find(existing,"rage") then
                local preset=http:JSONDecode(http:JSONEncode(initialConfig))
                if preset.ragebot then preset.ragebot.enabled=true preset.ragebot.pointBlank=true preset.ragebot.wallCheck=false end
                configStore:save("rage",preset)
            end
        end)
        Rayfield:Notify({Title="Presets",Content=ok and "Presets ready. Refresh the Configs list to select them." or tostring(message),Duration=6})
    end})
    local loadedAutoload,autoloadError=pcall(function()
        local name=configStore:getAutoload()
        if name then prepareConfig(configStore:load(name))() end
    end)
    if not loadedAutoload then Rayfield:Notify({Title="Autoload",Content=tostring(autoloadError),Duration=7}) end
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
