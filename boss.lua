-- ============================================================================
-- GAROU PERFECTED SYSTEM (DYNAMIC STUN & FORCED MOTION OVERRIDE ENGINE)
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

-- Re-hook on respawn to guarantee it never drops tracking
Player.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = newChar:WaitForChild("Humanoid")
    Animator = Humanoid:WaitForChild("Animator")
    RootPart = newChar:WaitForChild("HumanoidRootPart")
end)

-- ============================================================================
-- 1. TRACK CONSOLIDATION MAP (Max Priority & Custom Offsets)
-- ============================================================================
local AnimationData = {
    ["10468665991"] = {Replacement = "17838006839", Speed = 0.9, TimePosition = 0, VFX = "HugeSlash"},     -- Move 1
    ["10466974800"] = {Replacement = "18181589384", Speed = 1.0, TimePosition = 0, VFX = "LastImpact"},    -- Move 2
    ["10471336737"] = {Replacement = "17838619895", Speed = 1.0, TimePosition = 0.3, Duration = 1.8, VFX = "BlackFlash"}, -- Move 3
    ["12510170988"] = {Replacement = "16515850153", Speed = 1.0, TimePosition = 0, VFX = "BigAura"},     -- Move 4
    ["15955393872"] = {Replacement = "15943915877", Speed = 1.0, TimePosition = 0.05},  -- Wall Combo
    ["12447707844"] = {Replacement = "17106858586", Speed = 1.0, TimePosition = 0},     -- Ult Activation
    ["10479335397"] = {Replacement = "13294790250", Speed = 1.3, TimePosition = 0, Duration = 1.8}, -- Dash
    ["10503381238"] = {Replacement = "14900168720", Speed = 0.7, TimePosition = 1.3},    -- Uppercut
    ["10470104242"] = {Replacement = "12447247483", Speed = 6.0, TimePosition = 0, Delay = 0.2},  -- Downslam
}

-- M1 Punch Replacements Map
local PunchReplacements = {
    ["17859015788"] = "12684185971", -- Downslam Finisher
    ["10469493270"] = "17889458563", -- Punch 1
    ["10469630950"] = "17889461810", -- Punch 2
    ["10469639222"] = "17889471098", -- Punch 3
    ["10469643643"] = "17889290569", -- Punch 4
    ["11365563255"] = "14516273501", -- Extra M1 Punch
}

-- Global tracking state to prevent walking loop from clipping combat skills
local IsAttackingOrStunned = false

-- ============================================================================
-- 2. DYNAMIC GAME REPLICATED VFX DEPLOYER
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
-- 3. STATE CONTROLS, TARGETING & UTILITIES
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
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.HumanoidRootPart.Position)
    else
        LockOnActive = false
        CurrentTarget = nil
    end
end)

-- FLIP UTILITIES
local function TriggerBackflip()
    DeployVFX("HunterMode", 5)
    RootPart.AssemblyLinearVelocity = (RootPart.CFrame.LookVector * -45) + Vector3.new(0, 32, 0)
end

local function TriggerFrontflip()
    DeployVFX("HunterMode", 5)
    RootPart.AssemblyLinearVelocity = (RootPart.CFrame.LookVector * 45) + Vector3.new(0, 32, 0)
end

-- ============================================================================
-- 4. INTEGRATED RUN TOOL INITIALIZATION (FORCED RUN FIX)
-- ============================================================================
local runTool = Instance.new("Tool")
runTool.Name = "Run Tool"
runTool.Parent = Player:WaitForChild("Backpack")
runTool.RequiresHandle = false

local isRunningWithTool = false
local toolMovementSpeed = 125

local ToolRunAnim = Instance.new("Animation")
ToolRunAnim.AnimationId = "rbxassetid://15962326593" -- Forcing your custom sprint track
local ToolRunTrack = nil

runTool.Equipped:Connect(function()
    isRunningWithTool = true
    IsAttackingOrStunned = false
    
    if Animator then
        ToolRunTrack = Animator:LoadAnimation(ToolRunAnim)
        ToolRunTrack.Priority = Enum.AnimationPriority.Action4 -- Overwrites base TSB run completely
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
-- 5. CENTRAL ANIMATION INTERCEPT ENGINE
-- ============================================================================
local function StopAllTracks()
    for _, track in ipairs(Animator:GetPlayingAnimationTracks()) do
        local trackId = track.Animation.AnimationId
        if trackId ~= "rbxassetid://15099756132" and trackId ~= "rbxassetid://15962326593" then
            track:Stop(0)
        end
    end
end

local function HandleInterception(animationTrack)
    local rawId = animationTrack.Animation.AnimationId:match("%d+")
    if not rawId then return end
    
    local config = AnimationData[rawId]
    if config then
        IsAttackingOrStunned = true -- Freeze walk loop
        animationTrack:Stop(0)
        StopAllTracks()
        
        task.spawn(function()
            if config.Delay then task.wait(config.Delay) end
            if config.VFX then DeployVFX(config.VFX, 20) end
            
            if rawId == "10466974800" then
                task.spawn(function()
                    local startTime = os.clock()
                    while os.clock() - startTime < 0.15 do
                        if RootPart then
                            RootPart.AssemblyLinearVelocity = Vector3.new(RootPart.AssemblyLinearVelocity.X, 65, RootPart.AssemblyLinearVelocity.Z)
                        end
                        RunService.Stepped:Wait()
                    end
                end)
            end
            
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
            
            -- Keep movement background frozen for duration of move
            if config.Duration then
                task.wait(config.Duration)
            else
                newTrack.Stopped:Wait()
            end
            
            newTrack:Stop(0.1)
            IsAttackingOrStunned = false -- Release walk loop safely
        end)
        return
    end
    
    local punchReplacementId = PunchReplacements[rawId]
    if punchReplacementId then
        IsAttackingOrStunned = true
        animationTrack:Stop(0)
        
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = "rbxassetid://" .. punchReplacementId
        local newTrack = Animator:LoadAnimation(newAnim)
        newTrack.Priority = Enum.AnimationPriority.Action4
        newTrack:Play(0)
        
        task.spawn(function()
            newTrack.Stopped:Wait()
            IsAttackingOrStunned = false
        end)
    end
end

Humanoid.AnimationPlayed:Connect(HandleInterception)

-- ============================================================================
-- 6. VELOCITY DAMPENER
-- ============================================================================
local function SecureVelocity(descendant)
    if descendant:IsA("BodyVelocity") then
        descendant.Velocity = Vector3.new(descendant.Velocity.X, 0, descendant.Velocity.Z)
    end
end

Character.DescendantAdded:Connect(SecureVelocity)
for _, desc in ipairs(Character:GetDescendants()) do SecureVelocity(desc) end

-- ============================================================================
-- 7. STATE CORE: SMART IDLE & WALK OVERLAY LOOPS
-- ============================================================================
local IdleAnim = Instance.new("Animation")
IdleAnim.AnimationId = "rbxassetid://15099756132"
local IdleTrack = Animator:LoadAnimation(IdleAnim)
IdleTrack.Priority = Enum.AnimationPriority.Action3

local RunAnim = Instance.new("Animation")
RunAnim.AnimationId = "rbxassetid://15962326593"
local RunTrack = Animator:LoadAnimation(RunAnim)
RunTrack.Priority = Enum.AnimationPriority.Action3

task.spawn(function()
    while true do
        if Character and Character.Parent and Humanoid and Humanoid.Health > 0 then
            -- Only overlay movement if not holding Run Tool and not actively swinging/using skills
            if not isRunningWithTool and not IsAttackingOrStunned then
                local isMoving = Humanoid.MoveDirection.Magnitude > 0 or RootPart.AssemblyLinearVelocity.Magnitude > 2
                
                if isMoving then
                    if IdleTrack.IsPlaying then IdleTrack:Stop(0.1) end
                    if not RunTrack.IsPlaying then RunTrack:Play(0.1) end
                else
                    if RunTrack.IsPlaying then RunTrack:Stop(0.1) end
                    if not IdleTrack.IsPlaying then IdleTrack:Play(0.1) end
                end
            else
                -- Instantly yields movement states if combat or sprinting tools are active
                if IdleTrack.IsPlaying then IdleTrack:Stop(0.1) end
                if RunTrack.IsPlaying then RunTrack:Stop(0.1) end
            end
        end
        task.wait(0.05)
    end
end)

-- ============================================================================
-- 8. UTILITIES OVERLAY LAYER (HUD Controls)
-- ============================================================================
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
    if LockOnActive then 
        CurrentTarget = GetClosestEnemy() 
    else 
        CurrentTarget = nil 
    end
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

-- ============================================================================
-- 9. RUNTIME EXTRACTIONS
-- ============================================================================
task.spawn(function()
    local messages = {"SYSTEM ACCESS GRANTED", "GAROU ENGINE ACTIVE", "VFX PIPELINES ONLINE"}
    local sayMessage = ReplicatedStorage:FindFirstChild("SayMessageRequest", true) or 
                       (ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and 
                        ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest"))
                       
    if sayMessage then
        for _, msg in ipairs(messages) do
            if sayMessage:IsA("RemoteEvent") then
                sayMessage:FireServer(msg, "All")
            elseif sayMessage:IsA("RemoteFunction") then
                sayMessage:InvokeServer(msg, "All")
            end
            task.wait(1.5)
        end
    end
end)
