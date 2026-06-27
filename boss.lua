-- ============================================================================
-- GAROU PERFECTED ANIMATION OVERHAUL SYSTEM (WITH VFX INTEGRATION)
-- ============================================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Animator = Humanoid:WaitForChild("Animator")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- ============================================================================
-- 1. TRACK CONSOLIDATION MAP (Your Exact Targets & Custom Offsets)
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

-- ============================================================================
-- 2. DYNAMIC GAME REPLICATED VFX DEPLOYER
-- ============================================================================
local function DeployVFX(vfxType, burstCount)
    local targetSource = nil
    pcall(function()
        if vfxType == "HunterMode" then
            targetSource = workspace.Live:FindFirstChild(Player.Name).HumanoidRootPart:FindFirstChild("HunterMode")
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
-- 3. CENTRAL ANIMATION INTERCEPT ENGINE
-- ============================================================================
local function StopAllTracks()
    for _, track in ipairs(Animator:GetPlayingAnimationTracks()) do
        track:Stop(0)
    end
end

local function HandleInterception(animationTrack)
    local rawId = animationTrack.Animation.AnimationId:match("%d+")
    if not rawId then return end
    
    -- Check Main Skill / Movement Maps
    local config = AnimationData[rawId]
    if config then
        animationTrack:Stop(0)
        StopAllTracks()
        
        task.spawn(function()
            if config.Delay then task.wait(config.Delay) end
            
            -- Trigger associated move VFX dynamically
            if config.VFX then
                DeployVFX(config.VFX, 20)
            end
            
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = "rbxassetid://" .. config.Replacement
            local newTrack = Animator:LoadAnimation(newAnim)
            
            newTrack:Play(0)
            if config.TimePosition > 0 then
                newTrack:AdjustSpeed(0)
                newTrack.TimePosition = config.TimePosition
            end
            newTrack:AdjustSpeed(config.Speed)
            
            if config.Duration then
                task.wait(config.Duration)
                newTrack:Stop(0.1)
            end
        end)
        return
    end
    
    -- Check M1/Punch Queued Map
    local punchReplacementId = PunchReplacements[rawId]
    if punchReplacementId then
        animationTrack:Stop(0)
        
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = "rbxassetid://" .. punchReplacementId
        local newTrack = Animator:LoadAnimation(newAnim)
        newTrack.Priority = Enum.AnimationPriority.Action
        newTrack:Play(0)
    end
end

Humanoid.AnimationPlayed:Connect(HandleInterception)

-- ============================================================================
-- 4. VELOCITY DAMPENER (Prevents Physics Overwrites & Flight Kicks)
-- ============================================================================
local function SecureVelocity(descendant)
    if descendant:IsA("BodyVelocity") then
        descendant.Velocity = Vector3.new(descendant.Velocity.X, 0, descendant.Velocity.Z)
    end
end

Character.DescendantAdded:Connect(SecureVelocity)
for _, desc in ipairs(Character:GetDescendants()) do SecureVelocity(desc) end

-- ============================================================================
-- 5. STATE CORE: DYNAMIC RUN & IDLE LOOPS
-- ============================================================================
local IdleAnim = Instance.new("Animation")
IdleAnim.AnimationId = "rbxassetid://15099756132"
local IdleTrack = Animator:LoadAnimation(IdleAnim)

local RunAnim = Instance.new("Animation")
RunAnim.AnimationId = "rbxassetid://15962326593"
local RunTrack = Animator:LoadAnimation(RunAnim)

task.spawn(function()
    while Character.Parent and Humanoid.Health > 0 do
        local isMoving = Humanoid.MoveDirection.Magnitude > 0
        
        if isMoving then
            if IdleTrack.IsPlaying then IdleTrack:Stop(0.2) end
            if not RunTrack.IsPlaying then RunTrack:Play(0.2) end
            -- Keep subtle trailing red aura while running
            DeployVFX("HunterMode", 1)
        else
            if RunTrack.IsPlaying then RunTrack:Stop(0.2) end
            if not IdleTrack.IsPlaying then IdleTrack:Play(0.2) end
        end
        task.wait(0.15)
    end
end)

-- ============================================================================
-- 6. RUNTIME EXTRACTIONS (Chat Announcements Fixed Syntax)
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
