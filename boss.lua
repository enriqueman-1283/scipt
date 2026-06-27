--[[ 
    CONSOLIDATED MASTER COMBAT ENGINE
    Uses direct script interception & standard tracking loops 
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Animator = Character:WaitForChild("Animator")

-- ============================================================================
-- 1. BASE TABLES & SETTINGS
-- ============================================================================
local animationIdsToStop = {
    [10468665991] = true, -- Move 1
    [10466974800] = true, -- Move 2
    [10471336737] = true, -- Move 3
    [12510170988] = true, -- Move 4
    [15955393872] = true, -- Wall combo
    [12447707844] = true, -- Ult Activation
    [10479335397] = true, -- Dash
    [10503381238] = true, -- Uppercut
    [10470104242] = true, -- Downslam
    [17859015788] = true, -- Downslam finisher
    [10469493270] = true, -- Punch 1
    [10469630950] = true, -- Punch 2
    [10469639222] = true, -- Punch 3
    [10469643643] = true, -- Punch 4
}

local replacementAnimations = {
    ["10468665991"] = "rbxassetid://17838006839", -- Move 1
    ["10466974800"] = "rbxassetid://18181589384", -- Move 2
    ["10471336737"] = "rbxassetid://17838619895", -- Move 3
    ["12510170988"] = "rbxassetid://16515850153", -- Move 4
    ["15955393872"] = "rbxassetid://15943915877", -- Wall combo
    ["12447707844"] = "rbxassetid://17106858586", -- Ult Activation
    ["10479335397"] = "rbxassetid://13294790250", -- Dash
    ["10503381238"] = "rbxassetid://14900168720", -- Uppercut
    ["10470104242"] = "rbxassetid://12447247483", -- Downslam
    ["10469493270"] = "rbxassetid://17889458563", -- Punch 1
    ["10469630950"] = "rbxassetid://17889461810", -- Punch 2
    ["10469639222"] = "rbxassetid://17889471098", -- Punch 3
    ["10469643643"] = "rbxassetid://17889290569", -- Punch 4
    ["17859015788"] = "rbxassetid://12684185971", -- Downslam finisher
    ["11365563255"] = "rbxassetid://14516273501", -- Special Table Flip Override
}

-- Punch Queue System Variables
local queue = {}
local isAnimating = false

-- ============================================================================
-- 2. REPLACEMENT HANDLERS
-- ============================================================================
local function playReplacementAnimation(animId)
    if isAnimating then
        table.insert(queue, animId)
        return
    end

    isAnimating = true
    local replacementId = replacementAnimations[tostring(animId)]
    if replacementId then
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = replacementId
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        
        -- Apply custom framing offsets based on configuration
        if animId == 10468665991 then     -- Move 1 tuning
            Anim:Play()
            Anim:AdjustSpeed(0.1)
            Anim.TimePosition = 0
            Anim:AdjustSpeed(0.9)
        elseif animId == 10471336737 then -- Move 3 tuning
            Anim:Play()
            Anim:AdjustSpeed(0)
            Anim.TimePosition = 0.3
            Anim:AdjustSpeed(1)
            task.delay(1.8, function() Anim:Stop() end)
        elseif animId == 10479335397 then -- Dash tuning
            Anim:Play()
            Anim:AdjustSpeed(0)
            Anim.TimePosition = 0
            Anim:AdjustSpeed(1.3)
            task.delay(1.8, function() Anim:Stop() end)
        elseif animId == 10503381238 then -- Uppercut tuning
            Anim:Play()
            Anim:AdjustSpeed(0)
            Anim.TimePosition = 1.3
            Anim:AdjustSpeed(0.7)
        elseif animId == 10470104242 then -- Downslam tuning
            task.wait(0.2)
            Anim:Play()
            Anim:AdjustSpeed(0)
            Anim.TimePosition = 0
            Anim:AdjustSpeed(6)
        elseif animId == 15955393872 or animId == 12447707844 or animId == 12510170988 then -- Offsets with basic starts
            local startOffset = (animId == 15955393872) and 0.05 or 0
            Anim:Play()
            Anim:AdjustSpeed(0)
            Anim.TimePosition = startOffset
            Anim:AdjustSpeed(1)
        else
            Anim:Play() -- Base M1 chain play
        end

        Anim.Stopped:Connect(function()
            isAnimating = false
            if #queue > 0 then
                local nextAnimationId = table.remove(queue, 1)
                playReplacementAnimation(nextAnimationId)
            end
        end)
    else
        isAnimating = false
    end
end

local function stopSpecificAnimations()
    for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
        local trackId = tonumber(track.Animation.AnimationId:match("%d+"))
        if trackId and animationIdsToStop[trackId] then
            track:Stop()
        end
    end
end

local function onAnimationPlayed(animationTrack)
    local animId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))
    if animId and animationIdsToStop[animId] then
        stopSpecificAnimations()
        animationTrack:Stop()

        if replacementAnimations[tostring(animId)] then
            playReplacementAnimation(animId)
        end
    end
end

Humanoid.AnimationPlayed:Connect(onAnimationPlayed)

-- ============================================================================
-- 3. VELOCITY LOOPS (Cleans character locks)
-- ============================================================================
local function onBodyVelocityAdded(bodyVelocity)
    if bodyVelocity:IsA("BodyVelocity") then
        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)
    end
end

Character.DescendantAdded:Connect(onBodyVelocityAdded)
for _, descendant in pairs(Character:GetDescendants()) do
    onBodyVelocityAdded(descendant)
end

-- ============================================================================
-- 4. BASE STATES LOOPS (Idle & Clean Run Engines)
-- ============================================================================
local IdleAnimObj = Instance.new("Animation")
IdleAnimObj.AnimationId = "rbxassetid://15099756132"
local IdleTrack = Animator:LoadAnimation(IdleAnimObj)

local RunAnimObj = Instance.new("Animation")
RunAnimObj.AnimationId = "rbxassetid://15962326593"
local RunTrack = Animator:LoadAnimation(RunAnimObj)

local function updateMovementTracks()
    local isMoving = Humanoid.MoveDirection.Magnitude > 0
    if isMoving then
        if IdleTrack.IsPlaying then IdleTrack:Stop(0.1) end
        if not RunTrack.IsPlaying then RunTrack:Play(0.1) end
    else
        if RunTrack.IsPlaying then RunTrack:Stop(0.1) end
        if not IdleTrack.IsPlaying then IdleTrack:Play(0.1) end
    end
end

Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(updateMovementTracks)
task.spawn(updateMovementTracks) -- Initial call to set active loop frames

-- ============================================================================
-- 5. CHAT MESSAGES EXECUTION
-- ============================================================================
task.spawn(function()
    local messages = {"MESSAGE x1", "MESSAGE x2", "MESSAGE x3", "MESSAGE x4"}
    for _, message in ipairs(messages) do
        pcall(function()
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        end)
        task.wait(1.7)
    end
end)

-- Lifeline tracking update for when character respawns
Player.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    Animator = Humanoid:WaitForChild("Animator")
    
    Character.DescendantAdded:Connect(onBodyVelocityAdded)
    for _, descendant in pairs(Character:GetDescendants()) do
        onBodyVelocityAdded(descendant)
    end
    
    Humanoid.AnimationPlayed:Connect(onAnimationPlayed)
    
    IdleTrack = Animator:LoadAnimation(IdleAnimObj)
    RunTrack = Animator:LoadAnimation(RunAnimObj)
    Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(updateMovementTracks)
    updateMovementTracks()
end)
