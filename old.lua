
-- things with a "*" is from inf yield

getgenv().debugXYZ = true

if getgenv().XYZ_LOADED and not getgenv().debugXYZ then
    error("Nuh uh, cant rerun buddy")
end -- *

pcall(function()
    getgenv().XYZ_LOADED = true
end) -- *

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- >> Services << --
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

-- >> Player Variables << --
local plr = Players.LocalPlayer

function getobj(v)
    local char = plr.Character
    local hum = char:WaitForChild("Humanoid")
    local hrp = char:WaitForChild("HumanoidRootPart")

    if v == 1 then
        return char
    elseif v == 2 then
        return hrp
    elseif v == 3 then
        return hum
    end
end

-- >> Variables << --
local walkflinging = false
local Clip = false

-- >> Functions << -- 

function FL(parent, text)
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("TextLabel") then
            local t = tostring(child.Text)
            if string.find(t, text, 1, true) then
                return child
            end
        end
        local result = FL(child, text)
        if result then return result end
    end
end

-- >> Script << -- 

print("Welcome to my party")
print("🥳 WOOOOOOOOOOOOOOOOOOOOOOOOOOOOO 🥳")
print("SYNTAXICAL BACK?!?!!?")
print("with a inf yield clone?!?!?!")
print("This won't be as good as IY, this just removes bloat ware and adds some custom features")
print("Please enjoy :3")

task.spawn(function()
    while wait() do
    if console then
    if CoreGui:FindFirstChild("DevConsoleMaster") then
        if CoreGui:FindFirstChild("DevConsoleMaster").DevConsoleWindow then
           if CoreGui:FindFirstChild("DevConsoleMaster").DevConsoleWindow:FindFirstChild("DevConsoleUI") then
            if CoreGui:FindFirstChild("DevConsoleMaster").DevConsoleWindow.DevConsoleUI:FindFirstChild("MainView") then
             if CoreGui:FindFirstChild("DevConsoleMaster").DevConsoleWindow.DevConsoleUI.MainView:FindFirstChild("ClientLog") then
                local label = FL(CoreGui:FindFirstChild("DevConsoleMaster").DevConsoleWindow.DevConsoleUI.MainView:FindFirstChild("ClientLog"), "Please enjoy :3")
                if label then
                    label.TextColor3 = Color3.fromRGB(0,255,0)
            end
           end
          end
         end
        end
       end
      end
    end
   end)

plr.Chatted:Connect(function(msg)
    if msg:sub(1,1) == ";" then
        if msg == ";fly" then 
        elseif msg == ";die" then
            getobj(3).Health = 0
        elseif msg == ';noclip' then
            Clip = false
            wait(0.1)
            local function NoclipLoop()
                if Clip == false and plr.Character ~= nil then
                    for _, child in pairs(plr.Character:GetDescendants()) do
                        if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                            child.CanCollide = false
                        end
                    end
                end
            end
            Noclipping = RunService.Stepped:Connect(NoclipLoop)
            elseif msg == "clip" then
                if Noclipping then
                Noclipping:Disconnect()
                end
                Clip = true
        elseif msg == ";unwalkfling" then
            walkflinging = false
        elseif msg == ";walkfling" then -- *
            execCmd("unwalkfling")
            local humanoid = getobj(3)
            if humanoid then
                humanoid.Died:Connect(function()
                    walkflinging = false
                end)
            end

            execCmd("noclip nonotify")
            walkflinging = true
            repeat RunService.Heartbeat:Wait()
                local character = speaker.Character
                local root = getRoot(character)
                local vel, movel = nil, 0.1

                while not (character and character.Parent and root and root.Parent) do
                    RunService.Heartbeat:Wait()
                    character = speaker.Character
                    root = getRoot(character)
                end

                vel = root.Velocity
                root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)

                RunService.RenderStepped:Wait()
                if character and character.Parent and root and root.Parent then
                    root.Velocity = vel
                end

                RunService.Stepped:Wait()
                if character and character.Parent and root and root.Parent then
                    root.Velocity = vel + Vector3.new(0, movel, 0)
                    movel = movel * -1
                end
            until walkflinging == false
        end
    end
end)


print("Loaded :3")
