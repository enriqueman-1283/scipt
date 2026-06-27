-- ============================================================
-- SHARED SETUP
-- ============================================================

local Players         = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService    = game:GetService("TweenService")
local RunService      = game:GetService("RunService")

local player    = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid  = character:WaitForChild("Humanoid")
local animator  = humanoid:WaitForChild("Animator")
local RootPart  = character:WaitForChild("HumanoidRootPart")

-- ============================================================
-- MOVE & ULTIMATE NAMES  (Script copy 1)
-- ============================================================

local playerGui   = player.PlayerGui
local hotbar      = playerGui:FindFirstChild("Hotbar")
local backpack    = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")

hotbarFrame:FindFirstChild("1").Base.ToolName.Text = "Fangs Of Red"
hotbarFrame:FindFirstChild("2").Base.ToolName.Text = "Throwup"
hotbarFrame:FindFirstChild("3").Base.ToolName.Text = "Held Slam"
hotbarFrame:FindFirstChild("4").Base.ToolName.Text = "Copied Counter Attempt"

local function setUltimateName(gui, name)
    local screenGui = gui:FindFirstChild("ScreenGui")
    if not screenGui then return end
    local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
    if not magicHealthFrame then return end
    local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
    if textLabel then
        textLabel.Text = name
    end
end

-- Script 1 ultimate name
local ultimateName1 = "Anger"
local function findGuiAndSetText1()
    setUltimateName(playerGui, ultimateName1)
end
playerGui.DescendantAdded:Connect(findGuiAndSetText1)
findGuiAndSetText1()

-- ============================================================
-- ANIMATION HANDLER (Script copy 1)
-- Each entry: triggerAnimId -> { replacementId, startTime, speed1, speed2, stopDelay }
-- speed1 = initial AdjustSpeed after TimePosition set (often 0 to seek cleanly)
-- speed2 = final playback speed
-- stopDelay = optional seconds after which to Stop() the anim (nil = never auto-stop)
-- ============================================================

local animMap1 = {
    -- Move 1: trigger 10468665991 -> replacement 18896229321
    ["10468665991"] = { id = "rbxassetid://18896229321", startTime = 0,   speed1 = 0.1, speed2 = 0.5 },
    -- Move 2: trigger 10466974800 -> replacement 18181589384
    ["10466974800"] = { id = "rbxassetid://18181589384", startTime = 0,   speed1 = 1,   speed2 = 1   },
    -- Move 3: trigger 10471336737 -> replacement 17838619895
    ["10471336737"] = { id = "rbxassetid://17838619895", startTime = 0.3, speed1 = 0,   speed2 = 1,  stopDelay = 1.8 },
    -- Move 4: trigger 12510170988 -> replacement 16515850153
    ["12510170988"] = { id = "rbxassetid://16515850153", startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Wall combo: trigger 15955393872 -> replacement 15943915877
    ["15955393872"] = { id = "rbxassetid://15943915877", startTime = 0.05,speed1 = 0,   speed2 = 1   },
    -- Ult Activation: trigger 12447707844 -> replacement 17106858586
    ["12447707844"] = { id = "rbxassetid://17106858586", startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Dash: trigger 10479335397 -> replacement 13294790250
    ["10479335397"] = { id = "rbxassetid://13294790250", startTime = 0,   speed1 = 0,   speed2 = 1.3, stopDelay = 1.8 },
    -- Uppercut: trigger 10503381238 -> replacement 14900168720
    ["10503381238"] = { id = "rbxassetid://14900168720", startTime = 1.3, speed1 = 0,   speed2 = 0.7 },
    -- Downslam: trigger 10470104242 -> replacement 12447247483
    ["10470104242"] = { id = "rbxassetid://12447247483", startTime = 0,   speed1 = 0,   speed2 = 6,  preWait = 0.2 },
}

local function playReplacementAnim(entry)
    local AnimObj = Instance.new("Animation")
    AnimObj.AnimationId = entry.id
    local track = animator:LoadAnimation(AnimObj)

    if entry.preWait then
        task.wait(entry.preWait)
    end

    track:Play()
    track:AdjustSpeed(entry.speed1)
    track.TimePosition = entry.startTime
    track:AdjustSpeed(entry.speed2)

    if entry.stopDelay then
        task.delay(entry.stopDelay, function()
            track:Stop()
        end)
    end
end

humanoid.AnimationPlayed:Connect(function(animTrack)
    local idStr = tostring(animTrack.Animation.AnimationId:match("%d+"))
    local entry = animMap1[idStr]
    if entry then
        -- Stop all currently playing anims
        for _, t in pairs(humanoid:GetPlayingAnimationTracks()) do
            t:Stop()
        end
        task.spawn(playReplacementAnim, entry)
    end
end)

-- ============================================================
-- MOVE & ULTIMATE NAMES  (Script copy 2)
-- ============================================================

-- Note: re-reads hotbar in case GUI loaded late
local function setHotbarNames2()
    local hb = playerGui:FindFirstChild("Hotbar")
    if not hb then return end
    local bp = hb:FindFirstChild("Backpack")
    if not bp then return end
    local hf = bp:FindFirstChild("Hotbar")
    if not hf then return end
    hf:FindFirstChild("1").Base.ToolName.Text = "Move1"
    hf:FindFirstChild("2").Base.ToolName.Text = "Move2"
    hf:FindFirstChild("3").Base.ToolName.Text = "Move3"
    hf:FindFirstChild("4").Base.ToolName.Text = "Move4"
end
setHotbarNames2()

local ultimateName2 = "UltimateName"
local function findGuiAndSetText2()
    setUltimateName(playerGui, ultimateName2)
end
playerGui.DescendantAdded:Connect(findGuiAndSetText2)
findGuiAndSetText2()

-- ============================================================
-- ANIMATION HANDLER (Script copy 2)
-- ============================================================

local animMap2 = {
    -- Move 1: trigger 10468665991 -> replacement 17838006839
    ["10468665991"] = { id = "rbxassetid://17838006839",     startTime = 0,   speed1 = 0.1, speed2 = 0.9 },
    -- Move 2: trigger 130301810149072 -> replacement 130301810149072
    ["130301810149072"] = { id = "rbxassetid://130301810149072", startTime = 0, speed1 = 1,   speed2 = 1   },
    -- Move 3: trigger 98542310119798 -> replacement 98542310119798
    ["98542310119798"] = { id = "rbxassetid://98542310119798",  startTime = 0.3, speed1 = 0, speed2 = 1, stopDelay = 1.8 },
    -- Move 4: trigger 12510170988 -> replacement 16515850153
    ["12510170988"] = { id = "rbxassetid://16515850153",     startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Wall combo: trigger 15955393872 -> replacement 15943915877
    ["15955393872"] = { id = "rbxassetid://15943915877",     startTime = 0.05,speed1 = 0,   speed2 = 1   },
    -- Ult Activation: trigger 12447707844 -> replacement 17106858586
    ["12447707844"] = { id = "rbxassetid://17106858586",     startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Dash: trigger 10479335397 -> replacement 13294790250
    ["10479335397"] = { id = "rbxassetid://13294790250",     startTime = 0,   speed1 = 0,   speed2 = 1.3, stopDelay = 1.8 },
    -- Uppercut: trigger 10503381238 -> replacement 14900168720
    ["10503381238"] = { id = "rbxassetid://14900168720",     startTime = 1.3, speed1 = 0,   speed2 = 0.7 },
    -- Downslam: trigger 10470104242 -> replacement 12447247483
    ["10470104242"] = { id = "rbxassetid://12447247483",     startTime = 0,   speed1 = 0,   speed2 = 6,  preWait = 0.2 },
}

humanoid.AnimationPlayed:Connect(function(animTrack)
    local idStr = tostring(animTrack.Animation.AnimationId:match("%d+"))
    local entry = animMap2[idStr]
    if entry then
        for _, t in pairs(humanoid:GetPlayingAnimationTracks()) do
            t:Stop()
        end
        task.spawn(playReplacementAnim, entry)
    end
end)

-- ============================================================
-- MOVE & ULTIMATE NAMES  (Script copy 3)
-- ============================================================

local function setHotbarNames3()
    local hb = playerGui:FindFirstChild("Hotbar")
    if not hb then return end
    local bp = hb:FindFirstChild("Backpack")
    if not bp then return end
    local hf = bp:FindFirstChild("Hotbar")
    if not hf then return end
    hf:FindFirstChild("1").Base.ToolName.Text = "Move1"
    hf:FindFirstChild("2").Base.ToolName.Text = "Move2"
    hf:FindFirstChild("3").Base.ToolName.Text = "Move3"
    hf:FindFirstChild("4").Base.ToolName.Text = "Move4"
end
setHotbarNames3()

local ultimateName3 = "UltimateName"
local function findGuiAndSetText3()
    setUltimateName(playerGui, ultimateName3)
end
playerGui.DescendantAdded:Connect(findGuiAndSetText3)
findGuiAndSetText3()

-- ============================================================
-- ANIMATION HANDLER (Script copy 3)
-- Same IDs as copy 1 original anims
-- ============================================================

local animMap3 = {
    ["10468665991"] = { id = "rbxassetid://17838006839",  startTime = 0,   speed1 = 0.1, speed2 = 0.9 },
    ["10466974800"] = { id = "rbxassetid://18181589384",  startTime = 0,   speed1 = 1,   speed2 = 1   },
    ["10471336737"] = { id = "rbxassetid://17838619895",  startTime = 0.3, speed1 = 0,   speed2 = 1,  stopDelay = 1.8 },
    ["12510170988"] = { id = "rbxassetid://16515850153",  startTime = 0,   speed1 = 0,   speed2 = 1   },
    ["15955393872"] = { id = "rbxassetid://15943915877",  startTime = 0.05,speed1 = 0,   speed2 = 1   },
    ["12447707844"] = { id = "rbxassetid://17106858586",  startTime = 0,   speed1 = 0,   speed2 = 1   },
    ["10479335397"] = { id = "rbxassetid://13294790250",  startTime = 0,   speed1 = 0,   speed2 = 1.3, stopDelay = 1.8 },
    ["10503381238"] = { id = "rbxassetid://14900168720",  startTime = 1.3, speed1 = 0,   speed2 = 0.7 },
    ["10470104242"] = { id = "rbxassetid://12447247483",  startTime = 0,   speed1 = 0,   speed2 = 6,  preWait = 0.2 },
}

humanoid.AnimationPlayed:Connect(function(animTrack)
    local idStr = tostring(animTrack.Animation.AnimationId:match("%d+"))
    local entry = animMap3[idStr]
    if entry then
        for _, t in pairs(humanoid:GetPlayingAnimationTracks()) do
            t:Stop()
        end
        task.spawn(playReplacementAnim, entry)
    end
end)

-- ============================================================
-- PUNCH ANIMATIONS (Script copy 1 version)
-- ============================================================

local animationIdsToStop1 = {
    [17859015788] = true, -- downslam finisher
    [10469493270] = true, -- punch1
    [10469630950] = true, -- punch2
    [10469639222] = true, -- punch3
    [10469643643] = true, -- punch4
}

local replacementAnimations1 = {
    ["10469493270"] = "rbxassetid://17889458563", -- punch1
    ["10469630950"] = "rbxassetid://17325510002", -- punch2
    ["10469639222"] = "rbxassetid://17889471098", -- punch3
    ["10469643643"] = "rbxassetid://16944345619", -- punch4
    ["17859015788"] = "rbxassetid://12684185971", -- downslam finisher
    ["11365563255"] = "rbxassetid://100558589307006", -- punch idk
}

local queue1     = {}
local isAnimating1 = false

local function playReplacementAnimation1(animId)
    if isAnimating1 then
        table.insert(queue1, animId)
        return
    end
    isAnimating1 = true
    local replacementId = replacementAnimations1[tostring(animId)]
    if replacementId then
        local AnimObj = Instance.new("Animation")
        AnimObj.AnimationId = replacementId
        local track = animator:LoadAnimation(AnimObj)
        track:Play()
        track.Stopped:Connect(function()
            isAnimating1 = false
            if #queue1 > 0 then
                playReplacementAnimation1(table.remove(queue1, 1))
            end
        end)
    else
        isAnimating1 = false
    end
end

local function stopSpecificAnimations1()
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        local id = tonumber(track.Animation.AnimationId:match("%d+"))
        if animationIdsToStop1[id] then
            track:Stop()
        end
    end
end

humanoid.AnimationPlayed:Connect(function(animTrack)
    local id = tonumber(animTrack.Animation.AnimationId:match("%d+"))
    if animationIdsToStop1[id] then
        stopSpecificAnimations1()
        animTrack:Stop()
        if replacementAnimations1[tostring(id)] then
            playReplacementAnimation1(id)
        end
    end
end)

-- ============================================================
-- PUNCH ANIMATIONS (Script copy 2 version — different replacements)
-- ============================================================

local animationIdsToStop2 = {
    [17859015788] = true,
    [10469493270] = true,
    [10469630950] = true,
    [10469639222] = true,
    [10469643643] = true,
}

local replacementAnimations2 = {
    ["10469493270"] = "rbxassetid://17889458563", -- punch1
    ["10469630950"] = "rbxassetid://17889461810", -- punch2
    ["10469639222"] = "rbxassetid://17889471098", -- punch3
    ["10469643643"] = "rbxassetid://17889290569", -- punch4
    ["17859015788"] = "rbxassetid://12684185971", -- downslam finisher
    ["11365563255"] = "rbxassetid://14516273501", -- punch idk
}

local queue2     = {}
local isAnimating2 = false

local function playReplacementAnimation2(animId)
    if isAnimating2 then
        table.insert(queue2, animId)
        return
    end
    isAnimating2 = true
    local replacementId = replacementAnimations2[tostring(animId)]
    if replacementId then
        local AnimObj = Instance.new("Animation")
        AnimObj.AnimationId = replacementId
        local track = animator:LoadAnimation(AnimObj)
        track:Play()
        track.Stopped:Connect(function()
            isAnimating2 = false
            if #queue2 > 0 then
                playReplacementAnimation2(table.remove(queue2, 1))
            end
        end)
    else
        isAnimating2 = false
    end
end

local function stopSpecificAnimations2()
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        local id = tonumber(track.Animation.AnimationId:match("%d+"))
        if animationIdsToStop2[id] then
            track:Stop()
        end
    end
end

humanoid.AnimationPlayed:Connect(function(animTrack)
    local id = tonumber(animTrack.Animation.AnimationId:match("%d+"))
    if animationIdsToStop2[id] then
        stopSpecificAnimations2()
        animTrack:Stop()
        if replacementAnimations2[tostring(id)] then
            playReplacementAnimation2(id)
        end
    end
end)

-- ============================================================
-- BODY VELOCITY FLATTENER (removes vertical knockback)
-- ============================================================

local function onBodyVelocityAdded(obj)
    if obj:IsA("BodyVelocity") then
        obj.Velocity = Vector3.new(obj.Velocity.X, 0, obj.Velocity.Z)
    end
end

character.DescendantAdded:Connect(onBodyVelocityAdded)
for _, descendant in pairs(character:GetDescendants()) do
    onBodyVelocityAdded(descendant)
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    RootPart = newCharacter:WaitForChild("HumanoidRootPart")
    newCharacter.DescendantAdded:Connect(onBodyVelocityAdded)
    for _, descendant in pairs(newCharacter:GetDescendants()) do
        onBodyVelocityAdded(descendant)
    end
end)

-- ============================================================
-- CHAT MESSAGE ON EXECUTE  (Script copy 1)
-- ============================================================

local messages1 = {"I FEEEELL SO ALIVVE"}

local function sendMessage(text)
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
end

for _, msg in ipairs(messages1) do
    sendMessage(msg)
    task.wait(1.7)
end

-- ============================================================
-- CHAT MESSAGE ON EXECUTE  (Script copy 2)
-- ============================================================

local messages2 = {"MESSAGE x1", "MESSAGE x2", "MESSAGE x3", "MESSAGE x4"}

for _, msg in ipairs(messages2) do
    sendMessage(msg)
    task.wait(1.7)
end

-- ============================================================
-- IDLE ANIMATION
-- ============================================================

do
    local idleAnimId = "rbxassetid://15099756132"
    local idleAnim   = Instance.new("Animation")
    idleAnim.AnimationId = idleAnimId
    local idleTrack  = animator:LoadAnimation(idleAnim)

    while true do
        if humanoid.MoveDirection.Magnitude == 0 then
            if not idleTrack.IsPlaying then
                idleTrack:Play()
            end
        else
            if idleTrack.IsPlaying then
                idleTrack:Stop()
            end
        end
        task.wait(0.1)
    end
end

-- ============================================================
-- RUN ANIMATION  (deduplicated — was pasted 5+ times)
-- ============================================================

do
    local runAnimId = "rbxassetid://15962326593"
    local runAnim   = Instance.new("Animation")
    runAnim.AnimationId = runAnimId

    local runTrack
    local isMoving = false

    local function playRunAnim()
        if not runTrack then
            runTrack = animator:LoadAnimation(runAnim)
        end
        if not isMoving then
            isMoving = true
            runTrack:Play()
        end
    end

    local function stopRunAnim()
        if isMoving and runTrack then
            isMoving = false
            runTrack:Stop()
        end
    end

    local function onMoveChanged()
        if humanoid.MoveDirection.Magnitude > 0 then
            playRunAnim()
        else
            stopRunAnim()
        end
    end

    humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onMoveChanged)
    onMoveChanged()
end

-- ============================================================
-- EXECUTE ANIMATION  (Script copy 1)
-- ============================================================

do
    local execAnim1 = Instance.new("Animation")
    execAnim1.AnimationId = "rbxassetid://95000469063288"
    local execTrack1 = animator:LoadAnimation(execAnim1)
    execTrack1:Play()
    execTrack1:AdjustSpeed(0)
    execTrack1.TimePosition = 0.05
    execTrack1:AdjustSpeed(1)
end

-- ============================================================
-- EXECUTE ANIMATION  (Script copy 2 & 3 — different ID)
-- ============================================================

do
    local execAnim2 = Instance.new("Animation")
    execAnim2.AnimationId = "rbxassetid://14611879113"
    local execTrack2 = animator:LoadAnimation(execAnim2)
    execTrack2:Play()
    execTrack2:AdjustSpeed(0)
    execTrack2.TimePosition = 0.05
    execTrack2:AdjustSpeed(1)
end

-- ============================================================
-- GAROU COLOR CHANGER  (Script copy 1: Red -> Blue gradient)
-- ============================================================

do
    local char1 = player.Character
    local redBlue = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255)),
    }

    local function applyColor(pp)
        if pp.Name ~= "WaterPalm" then return end
        for _, v in pairs(pp:WaitForChild("ConstantEmit"):GetChildren()) do
            v.Color = redBlue
        end
        pp:WaitForChild("WaterTrail").Color = redBlue
    end

    getgenv().LArmCol = char1["Left Arm"].ChildAdded:Connect(applyColor)
    getgenv().RArmCol = char1["Right Arm"].ChildAdded:Connect(applyColor)
end

-- ============================================================
-- GAROU COLOR CHANGER  (Script copy 3: Red -> Red solid)
-- ============================================================

do
    local char3 = player.Character
    local redSolid = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0)),
    }

    local function applyColor3(pp)
        if pp.Name ~= "WaterPalm" then return end
        for _, v in pairs(pp:WaitForChild("ConstantEmit"):GetChildren()) do
            v.Color = redSolid
        end
        pp:WaitForChild("WaterTrail").Color = redSolid
    end

    getgenv().LArmCol3 = char3["Left Arm"].ChildAdded:Connect(applyColor3)
    getgenv().RArmCol3 = char3["Right Arm"].ChildAdded:Connect(applyColor3)
end

-- ============================================================
-- RUN TOOL
-- ============================================================

local runTool = Instance.new("Tool")
runTool.Name = "Run Tool"
runTool.Parent = player:WaitForChild("Backpack")
runTool.RequiresHandle = false

local isRunningWithTool = false
local toolMovementSpeed = 125

local ToolRunAnim = Instance.new("Animation")
ToolRunAnim.AnimationId = "rbxassetid://15962326593"
local ToolRunTrack = nil

runTool.Equipped:Connect(function()
    isRunningWithTool = true
    if animator then
        ToolRunTrack = animator:LoadAnimation(ToolRunAnim)
        ToolRunTrack.Priority = Enum.AnimationPriority.Action4
        ToolRunTrack:Play(0.1)
        ToolRunTrack:AdjustSpeed(1.4)
    end
    task.spawn(function()
        while isRunningWithTool do
            if RootPart then
                RootPart.AssemblyLinearVelocity = Vector3.new(
                    RootPart.CFrame.LookVector.X * toolMovementSpeed,
                    RootPart.AssemblyLinearVelocity.Y,
                    RootPart.CFrame.LookVector.Z * toolMovementSpeed
                )
            end
            RunService.Stepped:Wait()
        end
    end)
end)

runTool.Unequipped:Connect(function()
    isRunningWithTool = false
    if ToolRunTrack then
        ToolRunTrack:Stop()
    end
end)

-- ============================================================
-- HIT VFX & SOUND
-- ============================================================

local LocalPlayer = Players.LocalPlayer
local lastHitTime = {}
local lastHealth  = {}

local soundIds = {
    "rbxassetid://13064223399",
    "rbxassetid://13064223291",
    "rbxassetid://13064223483",
}

local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Parent = game.Lighting
colorCorrection.TintColor = Color3.new(1, 1, 1)
colorCorrection.Brightness = 0

local redTintColor    = Color3.new(1, 0, 0)
local flashDuration   = 0.5
local recoveryDuration = 1

local function flashRed()
    coroutine.wrap(function()
        local redFlashTween = TweenService:Create(
            colorCorrection,
            TweenInfo.new(flashDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            { TintColor = redTintColor, Brightness = 0.2 }
        )
        local recoveryTween = TweenService:Create(
            colorCorrection,
            TweenInfo.new(recoveryDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            { TintColor = Color3.new(1, 1, 1), Brightness = 0 }
        )
        redFlashTween:Play()
        redFlashTween.Completed:Wait()
        recoveryTween:Play()
    end)()
end

workspace.Thrown.ChildAdded:Connect(function(child)
    task.defer(function()
        if child.Name == "Clone_Rig" then
            if child:FindFirstChild("Shirt") then
                if child.Shirt.ShirtTemplate == player.Character.Shirt.ShirtTemplate then
                    child:Destroy()
                end
            end
        end
    end)
end)

local function playRandomSound(targetCharacter)
    local randomIndex = math.random(1, #soundIds)
    local sound = Instance.new("Sound")
    sound.SoundId = soundIds[randomIndex]
    sound.Volume = 1
    sound.Parent = targetCharacter.HumanoidRootPart
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function onHealthChanged(targetCharacter, hum)
    hum.HealthChanged:Connect(function(newHealth)
        local oldHealth = lastHealth[targetCharacter] or hum.MaxHealth
        if newHealth < oldHealth and newHealth < hum.MaxHealth then
            if targetCharacter:GetAttribute("LastHit") == LocalPlayer.Name then
                local currentTime = tick()
                local lastTime = lastHitTime[targetCharacter] or 0
                if currentTime - lastTime >= 0.25 then
                    local StrongMone = Instance.new("Attachment")
                    game.Debris:AddItem(StrongMone, 3)
                    StrongMone.Name = "StrongMone"
                    StrongMone.Parent = targetCharacter.HumanoidRootPart

                    local Shockwaves2 = Instance.new("ParticleEmitter")
                    Shockwaves2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.466667,0.470588,0.470588),0),ColorSequenceKeypoint.new(0.495,Color3.new(0,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
                    Shockwaves2.Drag = 5
                    Shockwaves2.EmissionDirection = Enum.NormalId.Back
                    Shockwaves2.Enabled = false
                    Shockwaves2:Emit(8)
                    Shockwaves2.FlipbookFramerate = NumberRange.new(18,20)
                    Shockwaves2.Lifetime = NumberRange.new(1,3)
                    Shockwaves2.LightEmission = 1
                    Shockwaves2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
                    Shockwaves2.Rate = 40
                    Shockwaves2.RotSpeed = NumberRange.new(100,400)
                    Shockwaves2.Rotation = NumberRange.new(0,360)
                    Shockwaves2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,5.11184,1.94737),NumberSequenceKeypoint.new(0.2,8.93842,3.89474),NumberSequenceKeypoint.new(0.3,11.1292,7.78947),NumberSequenceKeypoint.new(0.517,15.7153,11.6842),NumberSequenceKeypoint.new(1,20.4474,11.6842)})
                    Shockwaves2.Speed = NumberRange.new(0.0146053,0.0146053)
                    Shockwaves2.SpreadAngle = Vector2.new(2,2)
                    Shockwaves2.Texture = "http://www.roblox.com/asset/?id=11703233149"
                    Shockwaves2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
                    Shockwaves2.Name = "Shockwaves2"
                    Shockwaves2.Parent = StrongMone

                    local Shockwaves3 = Instance.new("ParticleEmitter")
                    Shockwaves3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.466667,0.470588,0.470588),0),ColorSequenceKeypoint.new(0.495,Color3.new(0,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
                    Shockwaves3.Drag = 5
                    Shockwaves3.EmissionDirection = Enum.NormalId.Back
                    Shockwaves3.Enabled = false
                    Shockwaves3.FlipbookFramerate = NumberRange.new(18,20)
                    Shockwaves3.Lifetime = NumberRange.new(0.5,0.5)
                    Shockwaves3.LightEmission = 1
                    Shockwaves3.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
                    Shockwaves3.Rate = 55
                    Shockwaves3:Emit(8)
                    Shockwaves3.RotSpeed = NumberRange.new(100,400)
                    Shockwaves3.Rotation = NumberRange.new(0,360)
                    Shockwaves3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,10.2237,3.89474),NumberSequenceKeypoint.new(0.2,17.8768,7.78947),NumberSequenceKeypoint.new(0.3,22.2584,15.5789),NumberSequenceKeypoint.new(0.517,31.4305,23.3684),NumberSequenceKeypoint.new(1,40.8947,23.3684)})
                    Shockwaves3.Speed = NumberRange.new(0.0146053,0.0146053)
                    Shockwaves3.Texture = "http://www.roblox.com/asset/?id=11703233149"
                    Shockwaves3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
                    Shockwaves3.Name = "Shockwaves3"
                    Shockwaves3.Parent = StrongMone

                    local DustShockwaves = Instance.new("ParticleEmitter")
                    DustShockwaves.Brightness = 5
                    DustShockwaves.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.988312,0.991241,1),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
                    DustShockwaves.Drag = 5
                    DustShockwaves.EmissionDirection = Enum.NormalId.Back
                    DustShockwaves.Enabled = false
                    DustShockwaves.FlipbookFramerate = NumberRange.new(18,20)
                    DustShockwaves.Lifetime = NumberRange.new(0.2,1.05)
                    DustShockwaves.LightEmission = 1
                    DustShockwaves.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
                    DustShockwaves.Rate = 25
                    DustShockwaves.Rotation = NumberRange.new(0,360)
                    DustShockwaves.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,58.421,0)})
                    DustShockwaves.Speed = NumberRange.new(0.0146053,0.0146053)
                    DustShockwaves.SpreadAngle = Vector2.new(10,10)
                    DustShockwaves.Texture = "http://www.roblox.com/asset/?id=11703216487"
                    DustShockwaves.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.96,0.04),NumberSequenceKeypoint.new(1,1,0)})
                    DustShockwaves.Name = "DustShockwaves"
                    DustShockwaves.Parent = StrongMone
                    DustShockwaves:Emit(8)

                    local RedDust2 = Instance.new("ParticleEmitter")
                    RedDust2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.988235,0.988235,0.988235),0),ColorSequenceKeypoint.new(1,Color3.new(0.988235,0.988235,0.988235),0)})
                    RedDust2.Drag = 4
                    RedDust2.EmissionDirection = Enum.NormalId.Back
                    RedDust2.Enabled = false
                    RedDust2.Lifetime = NumberRange.new(0.1,1)
                    RedDust2.LightEmission = 0.800000011920929
                    RedDust2.Orientation = Enum.ParticleOrientation.VelocityParallel
                    RedDust2.Rate = 40
                    RedDust2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.281,2.91889,2.74074),NumberSequenceKeypoint.new(1,7.30263,3.89474)})
                    RedDust2.Speed = NumberRange.new(18.75,90)
                    RedDust2.SpreadAngle = Vector2.new(25,25)
                    RedDust2.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-0.5,0.5),NumberSequenceKeypoint.new(1,-1,1)})
                    RedDust2.Texture = "rbxassetid://7216854921"
                    RedDust2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.339323,0,0),NumberSequenceKeypoint.new(0.80798,0.3625,0),NumberSequenceKeypoint.new(1,1,0)})
                    RedDust2.Name = "RedDust2"
                    RedDust2.Parent = StrongMone
                    RedDust2:Emit(15)

                    local Push = Instance.new("ParticleEmitter")
                    Push.Brightness = 2
                    Push.Drag = 10
                    Push.EmissionDirection = Enum.NormalId.Back
                    Push.Enabled = false
                    Push.FlipbookFramerate = NumberRange.new(30,30)
                    Push.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
                    Push.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
                    Push.Lifetime = NumberRange.new(0.1,0.5)
                    Push.Rate = 115
                    Push.RotSpeed = NumberRange.new(-35,35)
                    Push.Rotation = NumberRange.new(-25,25)
                    Push.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.36514,0.8125),NumberSequenceKeypoint.new(0.632135,12.9375,0),NumberSequenceKeypoint.new(1,12.9375,0)})
                    Push.Speed = NumberRange.new(0,375)
                    Push.SpreadAngle = Vector2.new(-15,15)
                    Push.Texture = "http://www.roblox.com/asset/?id=9160490836"
                    Push.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0.9375,0.0625)})
                    Push.ZOffset = 1
                    Push.Name = "Push"
                    Push.Parent = StrongMone
                    Push:Emit(8)

                    playRandomSound(targetCharacter)
                    flashRed()
                    lastHitTime[targetCharacter] = currentTime
                end
            end
        end
        lastHealth[targetCharacter] = newHealth
    end)
end

for _, v in workspace.Live:GetChildren() do
    if v:IsA("Model") then
        local hum = v:FindFirstChild("Humanoid")
        if hum then
            onHealthChanged(v, hum)
        end
    end
end

workspace.Live.ChildAdded:Connect(function(instance)
    instance:WaitForChild("Humanoid")
    onHealthChanged(instance, instance.Humanoid)
end)

-- ============================================================
-- LAND ANIMATION
-- ============================================================

do
    local LandAnim = Instance.new("Animation")
    LandAnim.AnimationId = "rbxassetid://98542310119798"
    local LandTrack = nil

    local StateConnection

    local function onStateChanged(_, newState)
        if newState == Enum.HumanoidStateType.Landed then
            if not LandTrack then
                LandTrack = animator:LoadAnimation(LandAnim)
                LandTrack.Priority = Enum.AnimationPriority.Action2
            end
            LandTrack:Play(0.05)
        end
    end

    StateConnection = humanoid.StateChanged:Connect(onStateChanged)

    player.CharacterAdded:Connect(function(newChar)
        character = newChar
        humanoid  = newChar:WaitForChild("Humanoid")
        animator  = humanoid:WaitForChild("Animator")
        LandTrack = nil
        if StateConnection then StateConnection:Disconnect() end
        StateConnection = humanoid.StateChanged:Connect(onStateChanged)
    end)
end-- ============================================================
-- SHARED SETUP
-- ============================================================

local Players         = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService    = game:GetService("TweenService")
local RunService      = game:GetService("RunService")

local player    = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid  = character:WaitForChild("Humanoid")
local animator  = humanoid:WaitForChild("Animator")
local RootPart  = character:WaitForChild("HumanoidRootPart")

-- ============================================================
-- MOVE & ULTIMATE NAMES  (Script copy 1)
-- ============================================================

local playerGui   = player.PlayerGui
local hotbar      = playerGui:FindFirstChild("Hotbar")
local backpack    = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")

hotbarFrame:FindFirstChild("1").Base.ToolName.Text = "Fangs Of Red"
hotbarFrame:FindFirstChild("2").Base.ToolName.Text = "Throwup"
hotbarFrame:FindFirstChild("3").Base.ToolName.Text = "Held Slam"
hotbarFrame:FindFirstChild("4").Base.ToolName.Text = "Copied Counter Attempt"

local function setUltimateName(gui, name)
    local screenGui = gui:FindFirstChild("ScreenGui")
    if not screenGui then return end
    local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
    if not magicHealthFrame then return end
    local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
    if textLabel then
        textLabel.Text = name
    end
end

-- Script 1 ultimate name
local ultimateName1 = "Anger"
local function findGuiAndSetText1()
    setUltimateName(playerGui, ultimateName1)
end
playerGui.DescendantAdded:Connect(findGuiAndSetText1)
findGuiAndSetText1()

-- ============================================================
-- ANIMATION HANDLER (Script copy 1)
-- Each entry: triggerAnimId -> { replacementId, startTime, speed1, speed2, stopDelay }
-- speed1 = initial AdjustSpeed after TimePosition set (often 0 to seek cleanly)
-- speed2 = final playback speed
-- stopDelay = optional seconds after which to Stop() the anim (nil = never auto-stop)
-- ============================================================

local animMap1 = {
    -- Move 1: trigger 10468665991 -> replacement 18896229321
    ["10468665991"] = { id = "rbxassetid://18896229321", startTime = 0,   speed1 = 0.1, speed2 = 0.5 },
    -- Move 2: trigger 10466974800 -> replacement 18181589384
    ["10466974800"] = { id = "rbxassetid://18181589384", startTime = 0,   speed1 = 1,   speed2 = 1   },
    -- Move 3: trigger 10471336737 -> replacement 17838619895
    ["10471336737"] = { id = "rbxassetid://17838619895", startTime = 0.3, speed1 = 0,   speed2 = 1,  stopDelay = 1.8 },
    -- Move 4: trigger 12510170988 -> replacement 16515850153
    ["12510170988"] = { id = "rbxassetid://16515850153", startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Wall combo: trigger 15955393872 -> replacement 15943915877
    ["15955393872"] = { id = "rbxassetid://15943915877", startTime = 0.05,speed1 = 0,   speed2 = 1   },
    -- Ult Activation: trigger 12447707844 -> replacement 17106858586
    ["12447707844"] = { id = "rbxassetid://17106858586", startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Dash: trigger 10479335397 -> replacement 13294790250
    ["10479335397"] = { id = "rbxassetid://13294790250", startTime = 0,   speed1 = 0,   speed2 = 1.3, stopDelay = 1.8 },
    -- Uppercut: trigger 10503381238 -> replacement 14900168720
    ["10503381238"] = { id = "rbxassetid://14900168720", startTime = 1.3, speed1 = 0,   speed2 = 0.7 },
    -- Downslam: trigger 10470104242 -> replacement 12447247483
    ["10470104242"] = { id = "rbxassetid://12447247483", startTime = 0,   speed1 = 0,   speed2 = 6,  preWait = 0.2 },
}

local function playReplacementAnim(entry)
    local AnimObj = Instance.new("Animation")
    AnimObj.AnimationId = entry.id
    local track = animator:LoadAnimation(AnimObj)

    if entry.preWait then
        task.wait(entry.preWait)
    end

    track:Play()
    track:AdjustSpeed(entry.speed1)
    track.TimePosition = entry.startTime
    track:AdjustSpeed(entry.speed2)

    if entry.stopDelay then
        task.delay(entry.stopDelay, function()
            track:Stop()
        end)
    end
end

humanoid.AnimationPlayed:Connect(function(animTrack)
    local idStr = tostring(animTrack.Animation.AnimationId:match("%d+"))
    local entry = animMap1[idStr]
    if entry then
        -- Stop all currently playing anims
        for _, t in pairs(humanoid:GetPlayingAnimationTracks()) do
            t:Stop()
        end
        task.spawn(playReplacementAnim, entry)
    end
end)

-- ============================================================
-- MOVE & ULTIMATE NAMES  (Script copy 2)
-- ============================================================

-- Note: re-reads hotbar in case GUI loaded late
local function setHotbarNames2()
    local hb = playerGui:FindFirstChild("Hotbar")
    if not hb then return end
    local bp = hb:FindFirstChild("Backpack")
    if not bp then return end
    local hf = bp:FindFirstChild("Hotbar")
    if not hf then return end
    hf:FindFirstChild("1").Base.ToolName.Text = "Move1"
    hf:FindFirstChild("2").Base.ToolName.Text = "Move2"
    hf:FindFirstChild("3").Base.ToolName.Text = "Move3"
    hf:FindFirstChild("4").Base.ToolName.Text = "Move4"
end
setHotbarNames2()

local ultimateName2 = "UltimateName"
local function findGuiAndSetText2()
    setUltimateName(playerGui, ultimateName2)
end
playerGui.DescendantAdded:Connect(findGuiAndSetText2)
findGuiAndSetText2()

-- ============================================================
-- ANIMATION HANDLER (Script copy 2)
-- ============================================================

local animMap2 = {
    -- Move 1: trigger 10468665991 -> replacement 17838006839
    ["10468665991"] = { id = "rbxassetid://17838006839",     startTime = 0,   speed1 = 0.1, speed2 = 0.9 },
    -- Move 2: trigger 130301810149072 -> replacement 130301810149072
    ["130301810149072"] = { id = "rbxassetid://130301810149072", startTime = 0, speed1 = 1,   speed2 = 1   },
    -- Move 3: trigger 98542310119798 -> replacement 98542310119798
    ["98542310119798"] = { id = "rbxassetid://98542310119798",  startTime = 0.3, speed1 = 0, speed2 = 1, stopDelay = 1.8 },
    -- Move 4: trigger 12510170988 -> replacement 16515850153
    ["12510170988"] = { id = "rbxassetid://16515850153",     startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Wall combo: trigger 15955393872 -> replacement 15943915877
    ["15955393872"] = { id = "rbxassetid://15943915877",     startTime = 0.05,speed1 = 0,   speed2 = 1   },
    -- Ult Activation: trigger 12447707844 -> replacement 17106858586
    ["12447707844"] = { id = "rbxassetid://17106858586",     startTime = 0,   speed1 = 0,   speed2 = 1   },
    -- Dash: trigger 10479335397 -> replacement 13294790250
    ["10479335397"] = { id = "rbxassetid://13294790250",     startTime = 0,   speed1 = 0,   speed2 = 1.3, stopDelay = 1.8 },
    -- Uppercut: trigger 10503381238 -> replacement 14900168720
    ["10503381238"] = { id = "rbxassetid://14900168720",     startTime = 1.3, speed1 = 0,   speed2 = 0.7 },
    -- Downslam: trigger 10470104242 -> replacement 12447247483
    ["10470104242"] = { id = "rbxassetid://12447247483",     startTime = 0,   speed1 = 0,   speed2 = 6,  preWait = 0.2 },
}

humanoid.AnimationPlayed:Connect(function(animTrack)
    local idStr = tostring(animTrack.Animation.AnimationId:match("%d+"))
    local entry = animMap2[idStr]
    if entry then
        for _, t in pairs(humanoid:GetPlayingAnimationTracks()) do
            t:Stop()
        end
        task.spawn(playReplacementAnim, entry)
    end
end)

-- ============================================================
-- MOVE & ULTIMATE NAMES  (Script copy 3)
-- ============================================================

local function setHotbarNames3()
    local hb = playerGui:FindFirstChild("Hotbar")
    if not hb then return end
    local bp = hb:FindFirstChild("Backpack")
    if not bp then return end
    local hf = bp:FindFirstChild("Hotbar")
    if not hf then return end
    hf:FindFirstChild("1").Base.ToolName.Text = "Move1"
    hf:FindFirstChild("2").Base.ToolName.Text = "Move2"
    hf:FindFirstChild("3").Base.ToolName.Text = "Move3"
    hf:FindFirstChild("4").Base.ToolName.Text = "Move4"
end
setHotbarNames3()

local ultimateName3 = "UltimateName"
local function findGuiAndSetText3()
    setUltimateName(playerGui, ultimateName3)
end
playerGui.DescendantAdded:Connect(findGuiAndSetText3)
findGuiAndSetText3()

-- ============================================================
-- ANIMATION HANDLER (Script copy 3)
-- Same IDs as copy 1 original anims
-- ============================================================

local animMap3 = {
    ["10468665991"] = { id = "rbxassetid://17838006839",  startTime = 0,   speed1 = 0.1, speed2 = 0.9 },
    ["10466974800"] = { id = "rbxassetid://18181589384",  startTime = 0,   speed1 = 1,   speed2 = 1   },
    ["10471336737"] = { id = "rbxassetid://17838619895",  startTime = 0.3, speed1 = 0,   speed2 = 1,  stopDelay = 1.8 },
    ["12510170988"] = { id = "rbxassetid://16515850153",  startTime = 0,   speed1 = 0,   speed2 = 1   },
    ["15955393872"] = { id = "rbxassetid://15943915877",  startTime = 0.05,speed1 = 0,   speed2 = 1   },
    ["12447707844"] = { id = "rbxassetid://17106858586",  startTime = 0,   speed1 = 0,   speed2 = 1   },
    ["10479335397"] = { id = "rbxassetid://13294790250",  startTime = 0,   speed1 = 0,   speed2 = 1.3, stopDelay = 1.8 },
    ["10503381238"] = { id = "rbxassetid://14900168720",  startTime = 1.3, speed1 = 0,   speed2 = 0.7 },
    ["10470104242"] = { id = "rbxassetid://12447247483",  startTime = 0,   speed1 = 0,   speed2 = 6,  preWait = 0.2 },
}

humanoid.AnimationPlayed:Connect(function(animTrack)
    local idStr = tostring(animTrack.Animation.AnimationId:match("%d+"))
    local entry = animMap3[idStr]
    if entry then
        for _, t in pairs(humanoid:GetPlayingAnimationTracks()) do
            t:Stop()
        end
        task.spawn(playReplacementAnim, entry)
    end
end)

-- ============================================================
-- PUNCH ANIMATIONS (Script copy 1 version)
-- ============================================================

local animationIdsToStop1 = {
    [17859015788] = true, -- downslam finisher
    [10469493270] = true, -- punch1
    [10469630950] = true, -- punch2
    [10469639222] = true, -- punch3
    [10469643643] = true, -- punch4
}

local replacementAnimations1 = {
    ["10469493270"] = "rbxassetid://17889458563", -- punch1
    ["10469630950"] = "rbxassetid://17325510002", -- punch2
    ["10469639222"] = "rbxassetid://17889471098", -- punch3
    ["10469643643"] = "rbxassetid://16944345619", -- punch4
    ["17859015788"] = "rbxassetid://12684185971", -- downslam finisher
    ["11365563255"] = "rbxassetid://100558589307006", -- punch idk
}

local queue1     = {}
local isAnimating1 = false

local function playReplacementAnimation1(animId)
    if isAnimating1 then
        table.insert(queue1, animId)
        return
    end
    isAnimating1 = true
    local replacementId = replacementAnimations1[tostring(animId)]
    if replacementId then
        local AnimObj = Instance.new("Animation")
        AnimObj.AnimationId = replacementId
        local track = animator:LoadAnimation(AnimObj)
        track:Play()
        track.Stopped:Connect(function()
            isAnimating1 = false
            if #queue1 > 0 then
                playReplacementAnimation1(table.remove(queue1, 1))
            end
        end)
    else
        isAnimating1 = false
    end
end

local function stopSpecificAnimations1()
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        local id = tonumber(track.Animation.AnimationId:match("%d+"))
        if animationIdsToStop1[id] then
            track:Stop()
        end
    end
end

humanoid.AnimationPlayed:Connect(function(animTrack)
    local id = tonumber(animTrack.Animation.AnimationId:match("%d+"))
    if animationIdsToStop1[id] then
        stopSpecificAnimations1()
        animTrack:Stop()
        if replacementAnimations1[tostring(id)] then
            playReplacementAnimation1(id)
        end
    end
end)

-- ============================================================
-- PUNCH ANIMATIONS (Script copy 2 version — different replacements)
-- ============================================================

local animationIdsToStop2 = {
    [17859015788] = true,
    [10469493270] = true,
    [10469630950] = true,
    [10469639222] = true,
    [10469643643] = true,
}

local replacementAnimations2 = {
    ["10469493270"] = "rbxassetid://17889458563", -- punch1
    ["10469630950"] = "rbxassetid://17889461810", -- punch2
    ["10469639222"] = "rbxassetid://17889471098", -- punch3
    ["10469643643"] = "rbxassetid://17889290569", -- punch4
    ["17859015788"] = "rbxassetid://12684185971", -- downslam finisher
    ["11365563255"] = "rbxassetid://14516273501", -- punch idk
}

local queue2     = {}
local isAnimating2 = false

local function playReplacementAnimation2(animId)
    if isAnimating2 then
        table.insert(queue2, animId)
        return
    end
    isAnimating2 = true
    local replacementId = replacementAnimations2[tostring(animId)]
    if replacementId then
        local AnimObj = Instance.new("Animation")
        AnimObj.AnimationId = replacementId
        local track = animator:LoadAnimation(AnimObj)
        track:Play()
        track.Stopped:Connect(function()
            isAnimating2 = false
            if #queue2 > 0 then
                playReplacementAnimation2(table.remove(queue2, 1))
            end
        end)
    else
        isAnimating2 = false
    end
end

local function stopSpecificAnimations2()
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        local id = tonumber(track.Animation.AnimationId:match("%d+"))
        if animationIdsToStop2[id] then
            track:Stop()
        end
    end
end

humanoid.AnimationPlayed:Connect(function(animTrack)
    local id = tonumber(animTrack.Animation.AnimationId:match("%d+"))
    if animationIdsToStop2[id] then
        stopSpecificAnimations2()
        animTrack:Stop()
        if replacementAnimations2[tostring(id)] then
            playReplacementAnimation2(id)
        end
    end
end)

-- ============================================================
-- BODY VELOCITY FLATTENER (removes vertical knockback)
-- ============================================================

local function onBodyVelocityAdded(obj)
    if obj:IsA("BodyVelocity") then
        obj.Velocity = Vector3.new(obj.Velocity.X, 0, obj.Velocity.Z)
    end
end

character.DescendantAdded:Connect(onBodyVelocityAdded)
for _, descendant in pairs(character:GetDescendants()) do
    onBodyVelocityAdded(descendant)
end

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    RootPart = newCharacter:WaitForChild("HumanoidRootPart")
    newCharacter.DescendantAdded:Connect(onBodyVelocityAdded)
    for _, descendant in pairs(newCharacter:GetDescendants()) do
        onBodyVelocityAdded(descendant)
    end
end)

-- ============================================================
-- CHAT MESSAGE ON EXECUTE  (Script copy 1)
-- ============================================================

local messages1 = {"I FEEEELL SO ALIVVE"}

local function sendMessage(text)
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
end

for _, msg in ipairs(messages1) do
    sendMessage(msg)
    task.wait(1.7)
end

-- ============================================================
-- CHAT MESSAGE ON EXECUTE  (Script copy 2)
-- ============================================================

local messages2 = {"MESSAGE x1", "MESSAGE x2", "MESSAGE x3", "MESSAGE x4"}

for _, msg in ipairs(messages2) do
    sendMessage(msg)
    task.wait(1.7)
end

-- ============================================================
-- IDLE ANIMATION
-- ============================================================

do
    local idleAnimId = "rbxassetid://15099756132"
    local idleAnim   = Instance.new("Animation")
    idleAnim.AnimationId = idleAnimId
    local idleTrack  = animator:LoadAnimation(idleAnim)

    while true do
        if humanoid.MoveDirection.Magnitude == 0 then
            if not idleTrack.IsPlaying then
                idleTrack:Play()
            end
        else
            if idleTrack.IsPlaying then
                idleTrack:Stop()
            end
        end
        task.wait(0.1)
    end
end

-- ============================================================
-- RUN ANIMATION  (deduplicated — was pasted 5+ times)
-- ============================================================

do
    local runAnimId = "rbxassetid://15962326593"
    local runAnim   = Instance.new("Animation")
    runAnim.AnimationId = runAnimId

    local runTrack
    local isMoving = false

    local function playRunAnim()
        if not runTrack then
            runTrack = animator:LoadAnimation(runAnim)
        end
        if not isMoving then
            isMoving = true
            runTrack:Play()
        end
    end

    local function stopRunAnim()
        if isMoving and runTrack then
            isMoving = false
            runTrack:Stop()
        end
    end

    local function onMoveChanged()
        if humanoid.MoveDirection.Magnitude > 0 then
            playRunAnim()
        else
            stopRunAnim()
        end
    end

    humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onMoveChanged)
    onMoveChanged()
end

-- ============================================================
-- EXECUTE ANIMATION  (Script copy 1)
-- ============================================================

do
    local execAnim1 = Instance.new("Animation")
    execAnim1.AnimationId = "rbxassetid://95000469063288"
    local execTrack1 = animator:LoadAnimation(execAnim1)
    execTrack1:Play()
    execTrack1:AdjustSpeed(0)
    execTrack1.TimePosition = 0.05
    execTrack1:AdjustSpeed(1)
end

-- ============================================================
-- EXECUTE ANIMATION  (Script copy 2 & 3 — different ID)
-- ============================================================

do
    local execAnim2 = Instance.new("Animation")
    execAnim2.AnimationId = "rbxassetid://14611879113"
    local execTrack2 = animator:LoadAnimation(execAnim2)
    execTrack2:Play()
    execTrack2:AdjustSpeed(0)
    execTrack2.TimePosition = 0.05
    execTrack2:AdjustSpeed(1)
end

-- ============================================================
-- GAROU COLOR CHANGER  (Script copy 1: Red -> Blue gradient)
-- ============================================================

do
    local char1 = player.Character
    local redBlue = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255)),
    }

    local function applyColor(pp)
        if pp.Name ~= "WaterPalm" then return end
        for _, v in pairs(pp:WaitForChild("ConstantEmit"):GetChildren()) do
            v.Color = redBlue
        end
        pp:WaitForChild("WaterTrail").Color = redBlue
    end

    getgenv().LArmCol = char1["Left Arm"].ChildAdded:Connect(applyColor)
    getgenv().RArmCol = char1["Right Arm"].ChildAdded:Connect(applyColor)
end

-- ============================================================
-- GAROU COLOR CHANGER  (Script copy 3: Red -> Red solid)
-- ============================================================

do
    local char3 = player.Character
    local redSolid = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0)),
    }

    local function applyColor3(pp)
        if pp.Name ~= "WaterPalm" then return end
        for _, v in pairs(pp:WaitForChild("ConstantEmit"):GetChildren()) do
            v.Color = redSolid
        end
        pp:WaitForChild("WaterTrail").Color = redSolid
    end

    getgenv().LArmCol3 = char3["Left Arm"].ChildAdded:Connect(applyColor3)
    getgenv().RArmCol3 = char3["Right Arm"].ChildAdded:Connect(applyColor3)
end

-- ============================================================
-- RUN TOOL
-- ============================================================

local runTool = Instance.new("Tool")
runTool.Name = "Run Tool"
runTool.Parent = player:WaitForChild("Backpack")
runTool.RequiresHandle = false

local isRunningWithTool = false
local toolMovementSpeed = 125

local ToolRunAnim = Instance.new("Animation")
ToolRunAnim.AnimationId = "rbxassetid://15962326593"
local ToolRunTrack = nil

runTool.Equipped:Connect(function()
    isRunningWithTool = true
    if animator then
        ToolRunTrack = animator:LoadAnimation(ToolRunAnim)
        ToolRunTrack.Priority = Enum.AnimationPriority.Action4
        ToolRunTrack:Play(0.1)
        ToolRunTrack:AdjustSpeed(1.4)
    end
    task.spawn(function()
        while isRunningWithTool do
            if RootPart then
                RootPart.AssemblyLinearVelocity = Vector3.new(
                    RootPart.CFrame.LookVector.X * toolMovementSpeed,
                    RootPart.AssemblyLinearVelocity.Y,
                    RootPart.CFrame.LookVector.Z * toolMovementSpeed
                )
            end
            RunService.Stepped:Wait()
        end
    end)
end)

runTool.Unequipped:Connect(function()
    isRunningWithTool = false
    if ToolRunTrack then
        ToolRunTrack:Stop()
    end
end)

-- ============================================================
-- HIT VFX & SOUND
-- ============================================================

local LocalPlayer = Players.LocalPlayer
local lastHitTime = {}
local lastHealth  = {}

local soundIds = {
    "rbxassetid://13064223399",
    "rbxassetid://13064223291",
    "rbxassetid://13064223483",
}

local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Parent = game.Lighting
colorCorrection.TintColor = Color3.new(1, 1, 1)
colorCorrection.Brightness = 0

local redTintColor    = Color3.new(1, 0, 0)
local flashDuration   = 0.5
local recoveryDuration = 1

local function flashRed()
    coroutine.wrap(function()
        local redFlashTween = TweenService:Create(
            colorCorrection,
            TweenInfo.new(flashDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            { TintColor = redTintColor, Brightness = 0.2 }
        )
        local recoveryTween = TweenService:Create(
            colorCorrection,
            TweenInfo.new(recoveryDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            { TintColor = Color3.new(1, 1, 1), Brightness = 0 }
        )
        redFlashTween:Play()
        redFlashTween.Completed:Wait()
        recoveryTween:Play()
    end)()
end

workspace.Thrown.ChildAdded:Connect(function(child)
    task.defer(function()
        if child.Name == "Clone_Rig" then
            if child:FindFirstChild("Shirt") then
                if child.Shirt.ShirtTemplate == player.Character.Shirt.ShirtTemplate then
                    child:Destroy()
                end
            end
        end
    end)
end)

local function playRandomSound(targetCharacter)
    local randomIndex = math.random(1, #soundIds)
    local sound = Instance.new("Sound")
    sound.SoundId = soundIds[randomIndex]
    sound.Volume = 1
    sound.Parent = targetCharacter.HumanoidRootPart
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function onHealthChanged(targetCharacter, hum)
    hum.HealthChanged:Connect(function(newHealth)
        local oldHealth = lastHealth[targetCharacter] or hum.MaxHealth
        if newHealth < oldHealth and newHealth < hum.MaxHealth then
            if targetCharacter:GetAttribute("LastHit") == LocalPlayer.Name then
                local currentTime = tick()
                local lastTime = lastHitTime[targetCharacter] or 0
                if currentTime - lastTime >= 0.25 then
                    local StrongMone = Instance.new("Attachment")
                    game.Debris:AddItem(StrongMone, 3)
                    StrongMone.Name = "StrongMone"
                    StrongMone.Parent = targetCharacter.HumanoidRootPart

                    local Shockwaves2 = Instance.new("ParticleEmitter")
                    Shockwaves2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.466667,0.470588,0.470588),0),ColorSequenceKeypoint.new(0.495,Color3.new(0,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
                    Shockwaves2.Drag = 5
                    Shockwaves2.EmissionDirection = Enum.NormalId.Back
                    Shockwaves2.Enabled = false
                    Shockwaves2:Emit(8)
                    Shockwaves2.FlipbookFramerate = NumberRange.new(18,20)
                    Shockwaves2.Lifetime = NumberRange.new(1,3)
                    Shockwaves2.LightEmission = 1
                    Shockwaves2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
                    Shockwaves2.Rate = 40
                    Shockwaves2.RotSpeed = NumberRange.new(100,400)
                    Shockwaves2.Rotation = NumberRange.new(0,360)
                    Shockwaves2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,5.11184,1.94737),NumberSequenceKeypoint.new(0.2,8.93842,3.89474),NumberSequenceKeypoint.new(0.3,11.1292,7.78947),NumberSequenceKeypoint.new(0.517,15.7153,11.6842),NumberSequenceKeypoint.new(1,20.4474,11.6842)})
                    Shockwaves2.Speed = NumberRange.new(0.0146053,0.0146053)
                    Shockwaves2.SpreadAngle = Vector2.new(2,2)
                    Shockwaves2.Texture = "http://www.roblox.com/asset/?id=11703233149"
                    Shockwaves2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
                    Shockwaves2.Name = "Shockwaves2"
                    Shockwaves2.Parent = StrongMone

                    local Shockwaves3 = Instance.new("ParticleEmitter")
                    Shockwaves3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.466667,0.470588,0.470588),0),ColorSequenceKeypoint.new(0.495,Color3.new(0,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
                    Shockwaves3.Drag = 5
                    Shockwaves3.EmissionDirection = Enum.NormalId.Back
                    Shockwaves3.Enabled = false
                    Shockwaves3.FlipbookFramerate = NumberRange.new(18,20)
                    Shockwaves3.Lifetime = NumberRange.new(0.5,0.5)
                    Shockwaves3.LightEmission = 1
                    Shockwaves3.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
                    Shockwaves3.Rate = 55
                    Shockwaves3:Emit(8)
                    Shockwaves3.RotSpeed = NumberRange.new(100,400)
                    Shockwaves3.Rotation = NumberRange.new(0,360)
                    Shockwaves3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,10.2237,3.89474),NumberSequenceKeypoint.new(0.2,17.8768,7.78947),NumberSequenceKeypoint.new(0.3,22.2584,15.5789),NumberSequenceKeypoint.new(0.517,31.4305,23.3684),NumberSequenceKeypoint.new(1,40.8947,23.3684)})
                    Shockwaves3.Speed = NumberRange.new(0.0146053,0.0146053)
                    Shockwaves3.Texture = "http://www.roblox.com/asset/?id=11703233149"
                    Shockwaves3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
                    Shockwaves3.Name = "Shockwaves3"
                    Shockwaves3.Parent = StrongMone

                    local DustShockwaves = Instance.new("ParticleEmitter")
                    DustShockwaves.Brightness = 5
                    DustShockwaves.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.988312,0.991241,1),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
                    DustShockwaves.Drag = 5
                    DustShockwaves.EmissionDirection = Enum.NormalId.Back
                    DustShockwaves.Enabled = false
                    DustShockwaves.FlipbookFramerate = NumberRange.new(18,20)
                    DustShockwaves.Lifetime = NumberRange.new(0.2,1.05)
                    DustShockwaves.LightEmission = 1
                    DustShockwaves.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
                    DustShockwaves.Rate = 25
                    DustShockwaves.Rotation = NumberRange.new(0,360)
                    DustShockwaves.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,58.421,0)})
                    DustShockwaves.Speed = NumberRange.new(0.0146053,0.0146053)
                    DustShockwaves.SpreadAngle = Vector2.new(10,10)
                    DustShockwaves.Texture = "http://www.roblox.com/asset/?id=11703216487"
                    DustShockwaves.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.96,0.04),NumberSequenceKeypoint.new(1,1,0)})
                    DustShockwaves.Name = "DustShockwaves"
                    DustShockwaves.Parent = StrongMone
                    DustShockwaves:Emit(8)

                    local RedDust2 = Instance.new("ParticleEmitter")
                    RedDust2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.988235,0.988235,0.988235),0),ColorSequenceKeypoint.new(1,Color3.new(0.988235,0.988235,0.988235),0)})
                    RedDust2.Drag = 4
                    RedDust2.EmissionDirection = Enum.NormalId.Back
                    RedDust2.Enabled = false
                    RedDust2.Lifetime = NumberRange.new(0.1,1)
                    RedDust2.LightEmission = 0.800000011920929
                    RedDust2.Orientation = Enum.ParticleOrientation.VelocityParallel
                    RedDust2.Rate = 40
                    RedDust2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.281,2.91889,2.74074),NumberSequenceKeypoint.new(1,7.30263,3.89474)})
                    RedDust2.Speed = NumberRange.new(18.75,90)
                    RedDust2.SpreadAngle = Vector2.new(25,25)
                    RedDust2.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-0.5,0.5),NumberSequenceKeypoint.new(1,-1,1)})
                    RedDust2.Texture = "rbxassetid://7216854921"
                    RedDust2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.339323,0,0),NumberSequenceKeypoint.new(0.80798,0.3625,0),NumberSequenceKeypoint.new(1,1,0)})
                    RedDust2.Name = "RedDust2"
                    RedDust2.Parent = StrongMone
                    RedDust2:Emit(15)

                    local Push = Instance.new("ParticleEmitter")
                    Push.Brightness = 2
                    Push.Drag = 10
                    Push.EmissionDirection = Enum.NormalId.Back
                    Push.Enabled = false
                    Push.FlipbookFramerate = NumberRange.new(30,30)
                    Push.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
                    Push.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
                    Push.Lifetime = NumberRange.new(0.1,0.5)
                    Push.Rate = 115
                    Push.RotSpeed = NumberRange.new(-35,35)
                    Push.Rotation = NumberRange.new(-25,25)
                    Push.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.36514,0.8125),NumberSequenceKeypoint.new(0.632135,12.9375,0),NumberSequenceKeypoint.new(1,12.9375,0)})
                    Push.Speed = NumberRange.new(0,375)
                    Push.SpreadAngle = Vector2.new(-15,15)
                    Push.Texture = "http://www.roblox.com/asset/?id=9160490836"
                    Push.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0.9375,0.0625)})
                    Push.ZOffset = 1
                    Push.Name = "Push"
                    Push.Parent = StrongMone
                    Push:Emit(8)

                    playRandomSound(targetCharacter)
                    flashRed()
                    lastHitTime[targetCharacter] = currentTime
                end
            end
        end
        lastHealth[targetCharacter] = newHealth
    end)
end

for _, v in workspace.Live:GetChildren() do
    if v:IsA("Model") then
        local hum = v:FindFirstChild("Humanoid")
        if hum then
            onHealthChanged(v, hum)
        end
    end
end

workspace.Live.ChildAdded:Connect(function(instance)
    instance:WaitForChild("Humanoid")
    onHealthChanged(instance, instance.Humanoid)
end)

-- ============================================================
-- LAND ANIMATION
-- ============================================================

do
    local LandAnim = Instance.new("Animation")
    LandAnim.AnimationId = "rbxassetid://98542310119798"
    local LandTrack = nil

    local StateConnection

    local function onStateChanged(_, newState)
        if newState == Enum.HumanoidStateType.Landed then
            if not LandTrack then
                LandTrack = animator:LoadAnimation(LandAnim)
                LandTrack.Priority = Enum.AnimationPriority.Action2
            end
            LandTrack:Play(0.05)
        end
    end

    StateConnection = humanoid.StateChanged:Connect(onStateChanged)

    player.CharacterAdded:Connect(function(newChar)
        character = newChar
        humanoid  = newChar:WaitForChild("Humanoid")
        animator  = humanoid:WaitForChild("Animator")
        LandTrack = nil
        if StateConnection then StateConnection:Disconnect() end
        StateConnection = humanoid.StateChanged:Connect(onStateChanged)
    end)
end
