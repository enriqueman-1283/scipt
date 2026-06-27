-- ============================================================================
-- MASTER COMBAT ENGINE (NATIVE INJECTION & CUSTOM REMIX CONFIGURATION)
-- ============================================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Animator = Humanoid:WaitForChild("Animator")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local PlayerGui = Player:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

-- Global tracking state to secure combat strings from movement overrides
local IsPerformingCombat = false
local MovementTrack = nil

-- ============================================================================
-- 1. REMIXED ANIMATION CONFIGURATION DATA MAP
-- ============================================================================
local AnimationData = {
    -- Move 1: Saitama Normal Punch -> Fracture of Tundra Boss: Permafrost
    ["10468665991"] = {Replacement = "100558589307006", Speed = 1.0, TimePosition = 0, VFX = "HugeSlash"},
    
    -- Move 2: Saitama Consecutive Punches -> Garou Crushed Rock Startup
    ["10466974800"] = {Replacement = "72451715583225", Speed = 1.0, TimePosition = 0, VFX = "LastImpact"},
    
    -- Move 3: Saitama Shove -> Child Emperor Weboom combo with Martial Artist Rising Fist
    ["10471336737"] = {Replacement = "113166426814229", Speed = 1.0, TimePosition = 0, Duration = 1.5, VFX = "BlackFlash"},
    
    -- Move 4: Saitama Uppercut -> Tatsumaki Windstorm Fury (Legacy Preservation)
    ["12510170988"] = {Replacement = "16515850153", Speed = 1.0, TimePosition = 0, VFX = "BigAura"},
    
    -- Miscellaneous Defaults & Awakening Switches
    ["15955393872"] = {Replacement = "18181589384", Speed = 1.0, TimePosition = 0.05},  -- Wall Combo -> Martial Artist
    ["12447707844"] = {Replacement = "18435535291", Speed = 1.0, TimePosition = 0},     -- Awk -> Martial Artist Awakening
    ["11365563255"] = {Replacement = "14516273501", Speed = 1.0, TimePosition = 0},     -- Table Flip Override
}

-- Comprehensive M1 Punch Translation Engine Map (Martial Artist Chains)
local PunchReplacements = {
    ["10469493270"] = "17889458563", -- Punch 1
    ["10469630950"] = "17889461810", -- Punch 2
    ["10469639222"] = "17889471098", -- Punch 3
    ["10469643643"] = "17889290569", -- Punch 4
}

-- ============================================================================
-- 2. DYNAMIC MOVEMENT LAYER (Handles KJ Dropkick without breaking default walks)
-- ============================================================================
local function ManageMovementTracks()
    if MovementTrack then 
        MovementTrack:Stop() 
        MovementTrack = nil 
    end
    
    local RunAnim = Instance.new("Animation")
    RunAnim.AnimationId = "rbxassetid://17354976067"
    MovementTrack = Animator:LoadAnimation(RunAnim)
    MovementTrack.Priority = Enum.AnimationPriority.Movement
    
    -- Listen to running states smoothly
    Humanoid.Running:Connect(function(speed)
        if speed > 0.1 and not IsPerformingCombat then
            if not MovementTrack.IsPlaying then
                MovementTrack:Play(0.2)
            end
        else
            if MovementTrack.IsPlaying then
                MovementTrack:Stop(0.2)
            end
        end
    end)
end

ManageMovementTracks()
Player.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = newChar:WaitForChild("Humanoid")
    Animator = Humanoid:WaitForChild("Animator")
    RootPart = newChar:WaitForChild("HumanoidRootPart")
    IsPerformingCombat = false
    ManageMovementTracks()
end)

-- ============================================================================
-- 3. DYNAMIC VFX ENGINE
-- ============================================================================
local function DeployVFX(vfxType, burstCount)
    local targetSource = nil
    pcall(function()
        if vfxType == "HunterMode" then
            local liveChar = workspace:FindFirstChild(Player.Name) or (workspace:FindFirstChild("Live") and workspace.Live:FindFirstChild(Player.Name))
            if liveChar and liveChar:FindFirstChild("HumanoidRootPart") then
                targetSource = liveChar.HumanoidRootPart:FindFirstChild("HunterMode")
            end
        elseif vfxType == "BigAura" then
            targetSource = ReplicatedStorage.Emotes.VFX.VfxMods.FS.vfx.BigAuraFx.Attachment
        elseif vfxType == "LastImpact" then
            targetSource = ReplicatedStorage.Emotes.VFX.VfxMods.Flasher.vfx.LastImpactFx.Attachment
        elseif vfxType == "BlackFlash" then
            targetSource = ReplicatedStorage.Emotes.VFX.VfxMods.Flasher.vfx.BlackFlashFx.Main
        elseif vfxType == "HugeSlash" then
            targetSource = ReplicatedStorage.Emotes.VFX.RealAssets.HugeSlash.SLASH.M
        end
    end)
    
    if targetSource and RootPart then
        local clonedVFX = targetSource:Clone()
        clonedVFX.Parent = RootPart
        for _, child in ipairs(clonedVFX:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                child:Emit(burstCount or 15)
                child.Enabled = true
            end
        end
        Debris:AddItem(clonedVFX, 2)
    end
end

-- ============================================================================
-- 4. FIXED LOCK-ON UTILITY & FLIPS
-- ============================================================================
local CurrentTarget = nil
local LockOnActive = false

local function GetClosestEnemy()
    local closestEnemy = nil
    local maxDistance = 250
    
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj ~= Character and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") then
            local p = Players:GetPlayerFromCharacter(obj)
            if (p or obj:FindFirstChild("Animate")) and obj.Humanoid.Health > 0 then
                local distance = (RootPart.Position - obj.HumanoidRootPart.Position).Magnitude
                if distance < maxDistance then
                    maxDistance = distance
                    closestEnemy = obj
                end
            end
        end
    end
    return closestEnemy
end

RunService.RenderStepped:Connect(function()
    if LockOnActive and CurrentTarget and CurrentTarget:FindFirstChild("HumanoidRootPart") and CurrentTarget:FindFirstChild("Humanoid") and CurrentTarget.Humanoid.Health > 0 then
        local targetPos = CurrentTarget.HumanoidRootPart.Position
        local cameraPos = Camera.CFrame.Position
        Camera.CFrame = CFrame.lookAt(cameraPos, targetPos)
        Camera.Focus = CurrentTarget.HumanoidRootPart.CFrame
    else
        LockOnActive = false
        CurrentTarget = nil
    end
end)

local function TriggerBackflip()
    DeployVFX("HunterMode", 5)
    RootPart.AssemblyLinearVelocity = (RootPart.CFrame.LookVector * -45) + Vector3.new(0, 32, 0)
end

local function TriggerFrontflip()
    DeployVFX("HunterMode", 5)
    RootPart.AssemblyLinearVelocity = (RootPart.CFrame.LookVector * 45) + Vector3.new(0, 32, 0)
end

-- ============================================================================
-- 5. INTEGRATED RUN TOOL INITIALIZATION (KJ 20-20-20 Sprint Integration)
-- ============================================================================
local runTool = Instance.new("Tool")
runTool.Name = "Run Tool"
runTool.Parent = Player:WaitForChild("Backpack")
runTool.RequiresHandle = false

local isRunningWithTool = false
local toolMovementSpeed = 125

local ToolRunAnim = Instance.new("Animation")
ToolRunAnim.AnimationId = "rbxassetid://17354976067"
local ToolRunTrack = nil

runTool.Equipped:Connect(function()
    isRunningWithTool = true
    if MovementTrack and MovementTrack.IsPlaying then MovementTrack:Stop() end
    if Animator then
        ToolRunTrack = Animator:LoadAnimation(ToolRunAnim)
        ToolRunTrack.Priority = Enum.AnimationPriority.Action4
        ToolRunTrack:Play(0.1)
        ToolRunTrack:AdjustSpeed(1.4)
    end

    task.spawn(function()
        while isRunningWithTool do
            if RootPart then
                RootPart.AssemblyLinearVelocity = Vector3.new(RootPart.CFrame.LookVector.X * toolMovementSpeed, RootPart.AssemblyLinearVelocity.Y, RootPart.CFrame.LookVector.Z * toolMovementSpeed)
                DeployVFX("HunterMode", 1)
            end
            RunService.Stepped:Wait()
        end
    end)
end)

runTool.Unequipped:Connect(function()
    isRunningWithTool = false
    if ToolRunTrack then
        ToolRunTrack:Stop(0.1)
        ToolRunTrack = nil
    end
end)

-- ============================================================================
-- 6. INTERCEPT FRAMEWORK (STOPS ENGINE BLOCKS DURING COMBAT)
-- ============================================================================
local function StopAllTracks()
    for _, track in ipairs(Animator:GetPlayingAnimationTracks()) do
        local trackId = track.Animation.AnimationId
        if trackId ~= "rbxassetid://15099756132" and trackId ~= "rbxassetid://17354976067" then
            track:Stop(0)
        end
    end
end

local function HandleInterception(animationTrack)
    local rawId = animationTrack.Animation.AnimationId:match("%d+")
    if not rawId then return end
    
    -- Stops the running overlay track immediately when a skill starts
    if IsPerformingCombat and (rawId == "15099756132" or rawId == "17354976067") then
        animationTrack:Stop(0)
        return
    end

    local config = AnimationData[rawId]
    if config then
        IsPerformingCombat = true
        if MovementTrack and MovementTrack.IsPlaying then MovementTrack:Stop(0.1) end
        animationTrack:Stop(0)
        StopAllTracks()
        
        task.spawn(function()
            if config.Delay then task.wait(config.Delay) end
            if config.VFX then DeployVFX(config.VFX, 20) end
            
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = "rbxassetid://" .. config.Replacement
            local newTrack = Animator:LoadAnimation(newAnim)
            
            newTrack.Priority = Enum.AnimationPriority.Action4
            newTrack:Play(0)
            
            if config.TimePosition > 0 then
                newTrack:AdjustSpeed(0)
                newTrack.TimePosition = config.TimePosition
            end
            newTrack:AdjustSpeed(config.Speed)
            
            -- Chain logic adjustment specifically built for Move 3 (Weboom into Rising Fist transition)
            if rawId == "10471336737" then
                task.wait(0.6)
                local comboAnim = Instance.new("Animation")
                comboAnim.AnimationId = "rbxassetid://18896127525"
                local comboTrack = Animator:LoadAnimation(comboAnim)
                comboTrack.Priority = Enum.AnimationPriority.Action4
                comboTrack:Play(0.1)
            end
            
            if config.Duration then
                task.wait(config.Duration)
                newTrack:Stop(0.1)
            else
                newTrack.Stopped:Wait()
            end
            IsPerformingCombat = false
        end)
        return
    end
    
    local punchReplacementId = PunchReplacements[rawId]
    if punchReplacementId then
        IsPerformingCombat = true
        if MovementTrack and MovementTrack.IsPlaying then MovementTrack:Stop(0.1) end
        animationTrack:Stop(0)
        
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = "rbxassetid://" .. punchReplacementId
        local newTrack = Animator:LoadAnimation(newAnim)
        newTrack.Priority = Enum.AnimationPriority.Action4
        newTrack:Play(0)
        
        task.spawn(function()
            newTrack.Stopped:Wait()
            task.wait(0.05)
            IsPerformingCombat = false
        end)
    end
end

Humanoid.AnimationPlayed:Connect(HandleInterception)

-- ============================================================================
-- 7. VELOCITY DAMPENER & HUD LAYER
-- ============================================================================
local function SecureVelocity(descendant)
    if descendant:IsA("BodyVelocity") then
        descendant.Velocity = Vector3.new(descendant.Velocity.X, 0, descendant.Velocity.Z)
    end
end

Character.DescendantAdded:Connect(SecureVelocity)
for _, desc in ipairs(Character:GetDescendants()) do SecureVelocity(desc) end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GarouUtilityHUD"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Container = Instance.new("Frame")
Container.Size = UDim2.new(0, 230, 0, 120)
Container.Position = UDim2.new(1, -250, 0.15, 0)
Container.BackgroundTransparency = 1
Container.Parent = ScreenGui

local function CreateMobileButton(name, position, color, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 45)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    button.TextColor3 = color
    button.Text = name
    button.Font = Enum.Font.GothamBold
    button.TextSize = 11
    button.Parent = Container
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = 1.5
    stroke.Parent = button
    button.Activated:Connect(callback)
end

local Crimson = Color3.fromRGB(255, 50, 50)

CreateMobileButton("LOCK ON", UDim2.new(0, 0, 0, 0), Crimson, function()
    LockOnActive = not LockOnActive
    if LockOnActive then CurrentTarget = GetClosestEnemy() else CurrentTarget = nil end
end)
CreateMobileButton("B-FLIP", UDim2.new(0, 115, 0, 0), Crimson, TriggerBackflip)
CreateMobileButton("F-FLIP", UDim2.new(0, 0, 0, 55), Crimson, TriggerFrontflip)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Q then
        LockOnActive = not LockOnActive
        if LockOnActive then CurrentTarget = GetClosestEnemy() else CurrentTarget = nil end
    end
end)
