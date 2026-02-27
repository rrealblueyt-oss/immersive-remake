local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local gui = player:WaitForChild("PlayerGui")
local mainUI = gui:WaitForChild("MainUI")
local initiator = mainUI:WaitForChild("Initiator"):WaitForChild("Main_Game")

StarterGui:SetCore("ChatMakeSystemMessage",{
	Text = "script loaded subbed by RealblueYT and THE_LOSTW3R",
	Color = Color3.fromRGB(0,162,255),
	Font = Enum.Font.GothamBold,
	TextSize = 18
})

require(initiator).caption("script immersive remake loaded subbed by RealblueYT and THE_LOSTW3R",true)

task.spawn(function()
	local shut = mainUI.MainFrame.IntroText
	local intro = shut:Clone()
	intro.Parent = mainUI
	intro.Name = "Fragment Mode Intro"
	intro.Visible = true
	intro.Text = "immersive remake"
	intro.TextTransparency = 0

	local underline = UDim2.new(1.1, 0, 0.015, 6)
	TweenService:Create(intro.Underline, TweenInfo.new(3), {Size = underline}):Play()
	task.wait(7)
	TweenService:Create(intro.Underline, TweenInfo.new(1.3), {Size = UDim2.new(0.95, 0, 0.015, 6)}):Play()
	task.wait(1)
	TweenService:Create(intro.Underline, TweenInfo.new(2), {ImageTransparency = 1}):Play()
	TweenService:Create(intro, TweenInfo.new(2), {TextTransparency = 1}):Play()
	TweenService:Create(intro.Underline, TweenInfo.new(7), {Size = UDim2.new(0, 0, 0.015, 6)}):Play()
	task.wait(2.3)
	intro.Visible = false
	task.wait(4)
	intro:Destroy()
end)

local rooms = workspace:WaitForChild("CurrentRooms")
local started = false

task.delay(20,function()
	started = true
end)

local entities = {
	{
		url = "https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Immersive%20mode/Detph",
		delay = {40,120}
	},
	{
		url = "https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Immersive%20mode/Router",
		delay = {30,110}
	},
	{
		url = "https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Immersive%20mode/Darkness",
		delay = {60,160}
	},
	{
		url = "https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Immersive%20mode/Hole",
		delay = {25,90}
	},
	{
		url = "https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Immersive%20mode/Flame",
		delay = {50,140}
	}
}

local chance = 0.4

rooms.ChildAdded:Connect(function(room)
	if not started then return end
	if #rooms:GetChildren() <= 1 then return end
	if math.random() > chance then return end

	local pick = entities[math.random(1,#entities)]
	local dmin = pick.delay[1]
	local dmax = pick.delay[2]

	task.spawn(function()
		task.wait(math.random(dmin,dmax))
		loadstring(game:HttpGet(pick.url))()
	end)
end)
