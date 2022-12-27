local vu = game:GetService("VirtualUser") -- AntiAfk
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

spawn(function() -- Network
    game.RunService.RenderStepped:Connect(function()
        game.Players.LocalPlayer.MaximumSimulationRadius = 1000;
        setsimulationradius(1000,1000)
    end)
end)

coroutine.resume(coroutine.create(function()
    while wait(3) do
        local function main()
            if player.Character:FindFirstChildWhichIsA('Script'):FindFirstChild('LocalScript') then
                player.Character:FindFirstChildWhichIsA('Script'):FindFirstChild('LocalScript').Disabled = true
            end
            if player.Character.UpperTorso:FindFirstChild('OriginalSize') then
                player.Character.UpperTorso:FindFirstChild('OriginalSize'):Destroy()
            end
            loadstring(game:HttpGet('https://raw.githubusercontent.com/swagmode/swagmode/main/swagnames'))()
        end
        local success, err = pcall(main)
    end
end))
