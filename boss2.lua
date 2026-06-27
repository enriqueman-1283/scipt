--Move & Ultimate Names
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("1").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move1"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("2").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move2"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("3").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move3"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("4").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move4"
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local playerGui = player:WaitForChild("PlayerGui")
 
 
local function findGuiAndSetText()
 
    local screenGui = playerGui:FindFirstChild("ScreenGui")
 
    if screenGui then
 
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
 
        if magicHealthFrame then
 
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
 
            if textLabel then
 
                textLabel.Text = "UltimateName"
 
            end
 
        end
 
    end
 
end
 
 
playerGui.DescendantAdded:Connect(findGuiAndSetText)
 
findGuiAndSetText()
 
--[[Animations]]
 
--[[Move 1]]
 
local animationId = 10468665991
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17838006839"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0.1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.9)
 
 
    end
 
end
 
--[[END OF MOVE 1 ANIM]]
 
--[[Move 2]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10466974800
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18181589384"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF MOVE 2 ANIM]]
 
--[[Move 3]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10471336737
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17838619895"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0.3
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end
 
--[[END OF MOVE 3 ANIM]]
 
--[[Move 4]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12510170988
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://16515850153"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF MOVE 4 ANIM]]
 
--[[Wall combo]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
local animationId = 15955393872
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://15943915877"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0.05
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF WALL COMBO ANIM]]
 
--[[Ult Activation]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12447707844
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17106858586 "
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
    end
 
end
--[[END OF ULT ACTIVATION ANIM]]
 
--[[Dash]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10479335397
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://13294790250"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1.3)
 
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end
 
--[[END OF DASH ANIM]]
 
--[[Uppercut]]
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10503381238
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://14900168720"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 1.3
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.7)
 
 
    end
 
end
 
--[[END OF UPPERCUT ANIM]]
 
--[[Downslam]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10470104242
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://12447247483"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
wait(0.2)
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(6)
 
 
    end
 
end
 
--[[END OF DOWNSLAM ANIM]]
 
--[[Punch anims]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local animationIdsToStop = {
 
    [17859015788] = true, --downslam finisher
 
    [10469493270] = true, --punch1
 
    [10469630950] = true, --punch2
 
    [10469639222] = true, --punch3
 
    [10469643643] = true, --punch4
 
}
 
 
local replacementAnimations = {
 
    ["10469493270"] = "rbxassetid://17889458563", --punch1
 
    ["10469630950"] = "rbxassetid://17889461810", --punch2
 
    ["10469639222"] = "rbxassetid://17889471098", --punch3
 
    ["10469643643"] = "rbxassetid://17889290569", --punch4
 
    ["17859015788"] = "rbxassetid://12684185971", --downslam finisher
 
    ["11365563255"] = "rbxassetid://14516273501" --punch idk
 
}
 
 
local queue = {}
 
local isAnimating = false
 
 
local function playReplacementAnimation(animationId)
 
    if isAnimating then
 
        table.insert(queue, animationId)
 
        return
 
    end
 
 
 
    isAnimating = true
 
    local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
    if replacementAnimationId then
 
        local AnimAnim = Instance.new("Animation")
 
        AnimAnim.AnimationId = replacementAnimationId
 
        local Anim = humanoid:LoadAnimation(AnimAnim)
 
        Anim:Play()
 
 
 
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
 
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
 
        local animationId = tonumber(track.Animation.AnimationId:match("%d+"))
 
        if animationIdsToStop[animationId] then
 
            track:Stop()
 
        end
 
    end
 
end
 
 
local function onAnimationPlayed(animationTrack)
 
    local animationId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))
 
    if animationIdsToStop[animationId] then
 
        stopSpecificAnimations()
 
        animationTrack:Stop()
 
 
 
        local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
        if replacementAnimationId then
 
            playReplacementAnimation(animationId)
 
        end
 
    end
 
end
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
 
local function onBodyVelocityAdded(bodyVelocity)
 
    if bodyVelocity:IsA("BodyVelocity") then
 
        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)
 
    end
 
end
 
 
character.DescendantAdded:Connect(onBodyVelocityAdded)
 
 
for _, descendant in pairs(character:GetDescendants()) do
 
    onBodyVelocityAdded(descendant)
 
end
 
 
player.CharacterAdded:Connect(function(newCharacter)
 
    character = newCharacter
 
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
    character.DescendantAdded:Connect(onBodyVelocityAdded)
 
 
 
    for _, descendant in pairs(character:GetDescendants()) do
 
        onBodyVelocityAdded(descendant)
 
    end
 
end) 
 
--[[Adding Quote or Message when Executed]]
 
local player = game.Players.LocalPlayer
repeat wait() until player.Character
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
-- Messages to send
local messages = {"MESSAGE x1", "MESSAGE x2", "MESSAGE x3", "MESSAGE x4"}
 
local function sendMessage(text)
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
end
 
for _, message in ipairs(messages) do
    sendMessage(message)
    wait(1.7) -- Wait time for each message
end
 
--[[END OF QUOTES]]
 
--[[Idle Animation]]
 
local animationId = "rbxassetid://15099756132" -- Replace with your animation ID
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
 
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local animationTrack = animator:LoadAnimation(animation)
 
local function isMoving()
    local velocity = humanoid.MoveDirection.Magnitude
    return velocity > 0
end
 
while true do
    if not isMoving() then
        if not animationTrack.IsPlaying then
            animationTrack:Play()
        end
    else
        if animationTrack.IsPlaying then
            animationTrack:Stop()
        end
    end
    wait(0.1)
end
 
 
--[[END OF IDLE ANIM]]
 
--[[Run Anim]]
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
--[[RUN ANIM END]]
 
--[[Execute Anims (Animations when you execute script]]
 
local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
    animTrack:Stop()
end
 
local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://14611879113" -- Replace with your animation ID
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
local startTime = 0.05
 
Anim:Play()
Anim:AdjustSpeed(0)
Anim.TimePosition = startTime
Anim:AdjustSpeed(1)
 
--[[END OF EXECUTE ANIMS]]
 
--[[Garou Color Changer !DELETE IF NOT NEEDED!]]
 
--[[LEFT ARM COLORS]]
 
local char = game.Players.LocalPlayer.Character
getgenv().LArmCol = char['Left Arm'].ChildAdded:Connect(function(pp)
if pp.Name == 'WaterPalm' then
for i,v in pairs(pp:WaitForChild('ConstantEmit'):GetChildren()) do
v.Color =
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
end
 
pp:WaitForChild('WaterTrail').Color = 
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
 
end end)
--[[RIGHT ARM colors]]
 
getgenv().RArmCol = char['Right Arm'].ChildAdded:Connect(function(pp)
if pp.Name == 'WaterPalm' then
for i,v in pairs(pp:WaitForChild('ConstantEmit'):GetChildren()) do
v.Color =
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
end
pp:WaitForChild('WaterTrail').Color = 
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue) 
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
 
end end)
 
--[[END OF GAROU COLORS]]--Move & Ultimate Names
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("1").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move1"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("2").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move2"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("3").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move3"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("4").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move4"
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local playerGui = player:WaitForChild("PlayerGui")
 
 
local function findGuiAndSetText()
 
    local screenGui = playerGui:FindFirstChild("ScreenGui")
 
    if screenGui then
 
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
 
        if magicHealthFrame then
 
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
 
            if textLabel then
 
                textLabel.Text = "UltimateName"
 
            end
 
        end
 
    end
 
end
 
 
playerGui.DescendantAdded:Connect(findGuiAndSetText)
 
findGuiAndSetText()
 
--[[Animations]]
 
--[[Move 1]]
 
local animationId = 10468665991
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17838006839"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0.1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.9)
 
 
    end
 
end
 
--[[END OF MOVE 1 ANIM]]
 
--[[Move 2]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10466974800
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18181589384"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF MOVE 2 ANIM]]
 
--[[Move 3]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10471336737
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17838619895"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0.3
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end
 
--[[END OF MOVE 3 ANIM]]
 
--[[Move 4]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12510170988
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://16515850153"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF MOVE 4 ANIM]]
 
--[[Wall combo]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
local animationId = 15955393872
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://15943915877"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0.05
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF WALL COMBO ANIM]]
 
--[[Ult Activation]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12447707844
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17106858586 "
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
    end
 
end
--[[END OF ULT ACTIVATION ANIM]]
 
--[[Dash]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10479335397
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://13294790250"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1.3)
 
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end
 
--[[END OF DASH ANIM]]
 
--[[Uppercut]]
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10503381238
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://14900168720"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 1.3
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.7)
 
 
    end
 
end
 
--[[END OF UPPERCUT ANIM]]
 
--[[Downslam]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10470104242
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://12447247483"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
wait(0.2)
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(6)
 
 
    end
 
end
 
--[[END OF DOWNSLAM ANIM]]
 
--[[Punch anims]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local animationIdsToStop = {
 
    [17859015788] = true, --downslam finisher
 
    [10469493270] = true, --punch1
 
    [10469630950] = true, --punch2
 
    [10469639222] = true, --punch3
 
    [10469643643] = true, --punch4
 
}
 
 
local replacementAnimations = {
 
    ["10469493270"] = "rbxassetid://17889458563", --punch1
 
    ["10469630950"] = "rbxassetid://17889461810", --punch2
 
    ["10469639222"] = "rbxassetid://17889471098", --punch3
 
    ["10469643643"] = "rbxassetid://17889290569", --punch4
 
    ["17859015788"] = "rbxassetid://12684185971", --downslam finisher
 
    ["11365563255"] = "rbxassetid://14516273501" --punch idk
 
}
 
 
local queue = {}
 
local isAnimating = false
 
 
local function playReplacementAnimation(animationId)
 
    if isAnimating then
 
        table.insert(queue, animationId)
 
        return
 
    end
 
 
 
    isAnimating = true
 
    local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
    if replacementAnimationId then
 
        local AnimAnim = Instance.new("Animation")
 
        AnimAnim.AnimationId = replacementAnimationId
 
        local Anim = humanoid:LoadAnimation(AnimAnim)
 
        Anim:Play()
 
 
 
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
 
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
 
        local animationId = tonumber(track.Animation.AnimationId:match("%d+"))
 
        if animationIdsToStop[animationId] then
 
            track:Stop()
 
        end
 
    end
 
end
 
 
local function onAnimationPlayed(animationTrack)
 
    local animationId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))
 
    if animationIdsToStop[animationId] then
 
        stopSpecificAnimations()
 
        animationTrack:Stop()
 
 
 
        local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
        if replacementAnimationId then
 
            playReplacementAnimation(animationId)
 
        end
 
    end
 
end
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
 
local function onBodyVelocityAdded(bodyVelocity)
 
    if bodyVelocity:IsA("BodyVelocity") then
 
        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)
 
    end
 
end
 
 
character.DescendantAdded:Connect(onBodyVelocityAdded)
 
 
for _, descendant in pairs(character:GetDescendants()) do
 
    onBodyVelocityAdded(descendant)
 
end
 
 
player.CharacterAdded:Connect(function(newCharacter)
 
    character = newCharacter
 
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
    character.DescendantAdded:Connect(onBodyVelocityAdded)
 
 
 
    for _, descendant in pairs(character:GetDescendants()) do
 
        onBodyVelocityAdded(descendant)
 
    end
 
end) 
 
--[[Adding Quote or Message when Executed]]
 
local player = game.Players.LocalPlayer
repeat wait() until player.Character
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
-- Messages to send
local messages = {"MESSAGE x1", "MESSAGE x2", "MESSAGE x3", "MESSAGE x4"}
 
local function sendMessage(text)
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
end
 
for _, message in ipairs(messages) do
    sendMessage(message)
    wait(1.7) -- Wait time for each message
end
 
--[[END OF QUOTES]]
 
--[[Idle Animation]]
 
local animationId = "rbxassetid://15099756132" -- Replace with your animation ID
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
 
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local animationTrack = animator:LoadAnimation(animation)
 
local function isMoving()
    local velocity = humanoid.MoveDirection.Magnitude
    return velocity > 0
end
 
while true do
    if not isMoving() then
        if not animationTrack.IsPlaying then
            animationTrack:Play()
        end
    else
        if animationTrack.IsPlaying then
            animationTrack:Stop()
        end
    end
    wait(0.1)
end
 
 
--[[END OF IDLE ANIM]]
 
--[[Run Anim]]
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
--[[RUN ANIM END]]
 
--[[Execute Anims (Animations when you execute script]]
 
local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
    animTrack:Stop()
end
 
local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://14611879113" -- Replace with your animation ID
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
local startTime = 0.05
 
Anim:Play()
Anim:AdjustSpeed(0)
Anim.TimePosition = startTime
Anim:AdjustSpeed(1)
 
--[[END OF EXECUTE ANIMS]]
 
--[[Garou Color Changer !DELETE IF NOT NEEDED!]]
 
--[[LEFT ARM COLORS]]
 
local char = game.Players.LocalPlayer.Character
getgenv().LArmCol = char['Left Arm'].ChildAdded:Connect(function(pp)
if pp.Name == 'WaterPalm' then
for i,v in pairs(pp:WaitForChild('ConstantEmit'):GetChildren()) do
v.Color =
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
end
 
pp:WaitForChild('WaterTrail').Color = 
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
 
end end)
--[[RIGHT ARM colors]]
 
getgenv().RArmCol = char['Right Arm'].ChildAdded:Connect(function(pp)
if pp.Name == 'WaterPalm' then
for i,v in pairs(pp:WaitForChild('ConstantEmit'):GetChildren()) do
v.Color =
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
end
pp:WaitForChild('WaterTrail').Color = 
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue) 
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(0, 0, 255))} -- Change Color (Red, Green, Blue)
 
end end)
 
--[[END OF GAROU COLORS]]--Move & Ultimate Names
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("1").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move1"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("2").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move2"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("3").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move3"
 
 
local player = game.Players.LocalPlayer
 
local playerGui = player.PlayerGui
 
local hotbar = playerGui:FindFirstChild("Hotbar")
 
local backpack = hotbar:FindFirstChild("Backpack")
 
local hotbarFrame = backpack:FindFirstChild("Hotbar")
 
local baseButton = hotbarFrame:FindFirstChild("4").Base
 
local ToolName = baseButton.ToolName
 
 
ToolName.Text = "Move4"
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local playerGui = player:WaitForChild("PlayerGui")
 
 
local function findGuiAndSetText()
 
    local screenGui = playerGui:FindFirstChild("ScreenGui")
 
    if screenGui then
 
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
 
        if magicHealthFrame then
 
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
 
            if textLabel then
 
                textLabel.Text = "UltimateName"
 
            end
 
        end
 
    end
 
end
 
 
playerGui.DescendantAdded:Connect(findGuiAndSetText)
 
findGuiAndSetText()
 
--[[Animations]]
 
--[[Move 1]]
 
local animationId = 10468665991
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17838006839"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0.1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.9)
 
 
    end
 
end
 
--[[END OF MOVE 1 ANIM]]
 
--[[Move 2]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10466974800
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://18181589384"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(1)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF MOVE 2 ANIM]]
 
--[[Move 3]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10471336737
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17838619895"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0.3
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end
 
--[[END OF MOVE 3 ANIM]]
 
--[[Move 4]]
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12510170988
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://16515850153"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF MOVE 4 ANIM]]
 
--[[Wall combo]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
local animationId = 15955393872
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://15943915877"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0.05
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
 
    end
 
end
 
--[[END OF WALL COMBO ANIM]]
 
--[[Ult Activation]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 12447707844
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://17106858586 "
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1)
 
    end
 
end
--[[END OF ULT ACTIVATION ANIM]]
 
--[[Dash]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10479335397
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://13294790250"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(1.3)
 
 
delay(1.8, function()
 
    Anim:Stop()
 
end)
 
 
    end
 
end
 
--[[END OF DASH ANIM]]
 
--[[Uppercut]]
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10503381238
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://14900168720"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 1.3
 
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(0.7)
 
 
    end
 
end
 
--[[END OF UPPERCUT ANIM]]
 
--[[Downslam]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local animationId = 10470104242
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local function onAnimationPlayed(animationTrack)
 
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
 
local p = game.Players.LocalPlayer
 
local Humanoid = p.Character:WaitForChild("Humanoid")
 
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
 
    animTrack:Stop()
 
end
 
 
local AnimAnim = Instance.new("Animation")
 
AnimAnim.AnimationId = "rbxassetid://12447247483"
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
 
local startTime = 0
 
 
wait(0.2)
 
Anim:Play()
 
Anim:AdjustSpeed(0)
 
Anim.TimePosition = startTime
 
Anim:AdjustSpeed(6)
 
 
    end
 
end
 
--[[END OF DOWNSLAM ANIM]]
 
--[[Punch anims]]
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoid = character:WaitForChild("Humanoid")
 
 
local animationIdsToStop = {
 
    [17859015788] = true, --downslam finisher
 
    [10469493270] = true, --punch1
 
    [10469630950] = true, --punch2
 
    [10469639222] = true, --punch3
 
    [10469643643] = true, --punch4
 
}
 
 
local replacementAnimations = {
 
    ["10469493270"] = "rbxassetid://17889458563", --punch1
 
    ["10469630950"] = "rbxassetid://17889461810", --punch2
 
    ["10469639222"] = "rbxassetid://17889471098", --punch3
 
    ["10469643643"] = "rbxassetid://17889290569", --punch4
 
    ["17859015788"] = "rbxassetid://12684185971", --downslam finisher
 
    ["11365563255"] = "rbxassetid://14516273501" --punch idk
 
}
 
 
local queue = {}
 
local isAnimating = false
 
 
local function playReplacementAnimation(animationId)
 
    if isAnimating then
 
        table.insert(queue, animationId)
 
        return
 
    end
 
 
 
    isAnimating = true
 
    local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
    if replacementAnimationId then
 
        local AnimAnim = Instance.new("Animation")
 
        AnimAnim.AnimationId = replacementAnimationId
 
        local Anim = humanoid:LoadAnimation(AnimAnim)
 
        Anim:Play()
 
 
 
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
 
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
 
        local animationId = tonumber(track.Animation.AnimationId:match("%d+"))
 
        if animationIdsToStop[animationId] then
 
            track:Stop()
 
        end
 
    end
 
end
 
 
local function onAnimationPlayed(animationTrack)
 
    local animationId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))
 
    if animationIdsToStop[animationId] then
 
        stopSpecificAnimations()
 
        animationTrack:Stop()
 
 
 
        local replacementAnimationId = replacementAnimations[tostring(animationId)]
 
        if replacementAnimationId then
 
            playReplacementAnimation(animationId)
 
        end
 
    end
 
end
 
 
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
 
 
local player = game.Players.LocalPlayer
 
local character = player.Character or player.CharacterAdded:Wait()
 
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
 
local function onBodyVelocityAdded(bodyVelocity)
 
    if bodyVelocity:IsA("BodyVelocity") then
 
        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)
 
    end
 
end
 
 
character.DescendantAdded:Connect(onBodyVelocityAdded)
 
 
for _, descendant in pairs(character:GetDescendants()) do
 
    onBodyVelocityAdded(descendant)
 
end
 
 
player.CharacterAdded:Connect(function(newCharacter)
 
    character = newCharacter
 
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
    character.DescendantAdded:Connect(onBodyVelocityAdded)
 
 
 
    for _, descendant in pairs(character:GetDescendants()) do
 
        onBodyVelocityAdded(descendant)
 
    end
 
end) 
 
--[[Adding Quote or Message when Executed]]
 
local player = game.Players.LocalPlayer
repeat wait() until player.Character
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
-- Messages to send
local messages = {"MESSAGE x1", "MESSAGE x2", "MESSAGE x3", "MESSAGE x4"}
 
local function sendMessage(text)
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
end
 
for _, message in ipairs(messages) do
    sendMessage(message)
    wait(1.7) -- Wait time for each message
end
 
--[[END OF QUOTES]]
 
--[[Idle Animation]]
 
local animationId = "rbxassetid://15099756132" -- Replace with your animation ID
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
 
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local animationTrack = animator:LoadAnimation(animation)
 
local function isMoving()
    local velocity = humanoid.MoveDirection.Magnitude
    return velocity > 0
end
 
while true do
    if not isMoving() then
        if not animationTrack.IsPlaying then
            animationTrack:Play()
        end
    else
        if animationTrack.IsPlaying then
            animationTrack:Stop()
        end
    end
    wait(0.1)
end
 
 
--[[END OF IDLE ANIM]]
 
--[[Run Anim]]
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
local animationId = "rbxassetid://15962326593" -- Replace with your animation ID
local animation = Instance.new("Animation")
animation.AnimationId = animationId
 
local animationTrack
local isMoving = false
 
local function playAnimation()
    if not animationTrack then
        animationTrack = animator:LoadAnimation(animation)
    end
 
    if not isMoving then
        isMoving = true
        animationTrack:Play()
    end
end
 
local function stopAnimation()
    if isMoving and animationTrack then
        isMoving = false
        animationTrack:Stop()
    end
end
 
local function onHumanoidChanged()
    if humanoid.MoveDirection.Magnitude > 0 then
        playAnimation()
    else
        stopAnimation()
    end
end
 
humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(onHumanoidChanged)
 
onHumanoidChanged()
 
--[[RUN ANIM END]]
 
--[[Execute Anims (Animations when you execute script]]
 
local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")
 
for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
    animTrack:Stop()
end
 
local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://14611879113" -- Replace with your animation ID
 
local Anim = Humanoid:LoadAnimation(AnimAnim)
 
local startTime = 0.05
 
Anim:Play()
Anim:AdjustSpeed(0)
Anim.TimePosition = startTime
Anim:AdjustSpeed(1)
 
--[[END OF EXECUTE ANIMS]]
 
--[[Garou Color Changer !DELETE IF NOT NEEDED!]]
 
--[[LEFT ARM COLORS]]
 
local char = game.Players.LocalPlayer.Character
getgenv().LArmCol = char['Left Arm'].ChildAdded:Connect(function(pp)
if pp.Name == 'WaterPalm' then
for i,v in pairs(pp:WaitForChild('ConstantEmit'):GetChildren()) do
v.Color =
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(255, 0, 0))} -- Change Color (Red, Green, Blue)
end
 
pp:WaitForChild('WaterTrail').Color = 
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(255, 0, 0))} -- Change Color (Red, Green, Blue)
 
end end)
--[[RIGHT ARM colors]]
 
getgenv().RArmCol = char['Right Arm'].ChildAdded:Connect(function(pp)
if pp.Name == 'WaterPalm' then
for i,v in pairs(pp:WaitForChild('ConstantEmit'):GetChildren()) do
v.Color =
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue)
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(255, 0, 0))} -- Change Color (Red, Green, Blue)
end
pp:WaitForChild('WaterTrail').Color = 
ColorSequence.new{ColorSequenceKeypoint.new(0.00, 
Color3.fromRGB(255, 0, 0)), -- Change Color (Red, Green, Blue) 
ColorSequenceKeypoint.new(1.00, 
Color3.fromRGB(255, 0, 0))} -- Change Color (Red, Green, Blue)
 
end end)
 
--[[END OF GAROU COLORS]]
local runTool = Instance.new("Tool")
runTool.Name = "Run Tool"
runTool.Parent = Player:WaitForChild("Backpack")
runTool.RequiresHandle = false

local isRunningWithTool = false
local toolMovementSpeed = 125

local ToolRunAnim = Instance.new("Animation")
ToolRunAnim.AnimationId = "rbxassetid://15962326593"
local ToolRunTrack = nil

runTool.Equipped:Connect(function()
    isRunningWithTool = true
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
end)local runTool = Instance.new("Tool")
runTool.Name = "Run Tool"
runTool.Parent = Player:WaitForChild("Backpack")
runTool.RequiresHandle = false

local isRunningWithTool = false
local toolMovementSpeed = 125

local ToolRunAnim = Instance.new("Animation")
ToolRunAnim.AnimationId = "rbxassetid://15962326593"
local ToolRunTrack = nil

runTool.Equipped:Connect(function()
    isRunningWithTool = true
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
end)local runTool = Instance.new("Tool")
runTool.Name = "Run Tool"
runTool.Parent = Player:WaitForChild("Backpack")
runTool.RequiresHandle = false

local isRunningWithTool = false
local toolMovementSpeed = 125

local ToolRunAnim = Instance.new("Animation")
ToolRunAnim.AnimationId = "rbxassetid://15962326593"
local ToolRunTrack = nil

runTool.Equipped:Connect(function()
    isRunningWithTool = true
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
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local TweenService = game:GetService("TweenService")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local lastHitTime = {} 

local soundIds = {
	"rbxassetid://13064223399",
	"rbxassetid://13064223291",
	"rbxassetid://13064223483"
}

local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Parent = game.Lighting
colorCorrection.TintColor = Color3.new(1, 1, 1) -- Default white
colorCorrection.Brightness = 0



local redTintColor = Color3.new(1, 0, 0) -- Red color
local flashDuration = 0.5  -- Duration of the flash (seconds)
local recoveryDuration = 1  -- Duration to return to normal (seconds)

local function flashRed()
	coroutine.wrap(function()
		-- Tween to red color
		local redFlashTween = TweenService:Create(
			colorCorrection, 
			TweenInfo.new(flashDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{ TintColor = redTintColor, Brightness = 0.2 } -- Brightness control for effect
		)

		-- Tween back to normal color
		local recoveryTween = TweenService:Create(
			colorCorrection, 
			TweenInfo.new(recoveryDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{ TintColor = Color3.new(1, 1, 1), Brightness = 0 }
		)

		-- Play the tweens
		redFlashTween:Play()
		redFlashTween.Completed:Wait()  -- Wait for the red flash to finish
		recoveryTween:Play()
	end)()
end

workspace.Thrown.ChildAdded:Connect(function(child)
	task.defer(function()
		if child.Name == "Clone_Rig" then
			if child:FindFirstChild("Shirt") then
				if child.Shirt.ShirtTemplate == game.Players.LocalPlayer.Character.Shirt.ShirtTemplate then
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

local lastHealth = {}

local function onHealthChanged(targetCharacter, humanoid)
	humanoid.HealthChanged:Connect(function(newHealth)
		local oldHealth = lastHealth[targetCharacter] or humanoid.MaxHealth 

		if newHealth < oldHealth then 
			if newHealth < humanoid.MaxHealth then
				if targetCharacter:GetAttribute("LastHit") == LocalPlayer.Name then
					local currentTime = tick()
					local lastTime = lastHitTime[targetCharacter] or 0
					if currentTime - lastTime >= 0.25 then
						local Module_Scripts = {}

						local StrongMone = Instance.new("Attachment")
						game.Debris:AddItem(StrongMone, 3)
						local Shockwaves2 = Instance.new("ParticleEmitter")
						local Shockwaves3 = Instance.new("ParticleEmitter")
						local DustShockwaves = Instance.new("ParticleEmitter")
						local RedDust2 = Instance.new("ParticleEmitter")
						local Push = Instance.new("ParticleEmitter")

						StrongMone.Name = [[StrongMone]]
						StrongMone.Parent = targetCharacter.HumanoidRootPart

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
						Shockwaves2.SpreadAngle = Vector2.new(2, 2)
						Shockwaves2.Texture = [[http://www.roblox.com/asset/?id=11703233149]]
						Shockwaves2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
						Shockwaves2.Name = [[Shockwaves2]]
						Shockwaves2.Parent = StrongMone

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
						Shockwaves3.Texture = [[http://www.roblox.com/asset/?id=11703233149]]
						Shockwaves3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
						Shockwaves3.Name = [[Shockwaves3]]
						Shockwaves3.Parent = StrongMone

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
						DustShockwaves.SpreadAngle = Vector2.new(10, 10)
						DustShockwaves.Texture = [[http://www.roblox.com/asset/?id=11703216487]]
						DustShockwaves.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.96,0.04),NumberSequenceKeypoint.new(1,1,0)})
						DustShockwaves.Name = [[DustShockwaves]]
						DustShockwaves.Parent = StrongMone
						DustShockwaves:Emit(8)

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
						RedDust2.SpreadAngle = Vector2.new(25, 25)
						RedDust2.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-0.5,0.5),NumberSequenceKeypoint.new(1,-1,1)})
						RedDust2.Texture = [[rbxassetid://7216854921]]
						RedDust2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.339323,0,0),NumberSequenceKeypoint.new(0.80798,0.3625,0),NumberSequenceKeypoint.new(1,1,0)})
						RedDust2.Name = [[RedDust2]]
						RedDust2.Parent = StrongMone
						RedDust2:Emit(15)

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
						Push.SpreadAngle = Vector2.new(-15, 15)
						Push.Texture = [[http://www.roblox.com/asset/?id=9160490836]]
						Push.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0.9375,0.0625)})
						Push.ZOffset = 1
						Push.Name = [[Push]]
						Push.Parent = StrongMone
						Push:Emit(8)

						playRandomSound(targetCharacter)
						lastHitTime[targetCharacter] = currentTime
					end
				end
			end
		end

		lastHealth[targetCharacter] = newHealth
	end)
end


for i, v in workspace.Live:GetChildren() do
	if v:IsA("Model") then
		local humanoid = v:FindFirstChild("Humanoid")
		if humanoid then
			onHealthChanged(v, humanoid)
		end
	end
end

workspace.Live.ChildAdded:Connect(function(instance)
	instance:WaitForChild("Humanoid")
	onHealthChanged(instance, instance.Humanoid)
end)
