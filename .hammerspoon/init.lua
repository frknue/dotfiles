function launchOrFocusApp(appName)
    local app = hs.application.get(appName)
    if app then
        app:activate() -- focus the app if it's running
    else
        hs.application.launchOrFocus(appName) -- otherwise, start the app
    end
end

hs.hotkey.bind({"ctrl"}, "'", function()
    launchOrFocusApp("iTerm")
end)

hs.hotkey.bind({"cmd"}, "1", function()
    launchOrFocusApp("Google Chrome")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "1", function()
    launchOrFocusApp("Visual Studio Code")
end)

hs.hotkey.bind({"cmd"}, "2", function()
    launchOrFocusApp("Arc")
end)

hs.hotkey.bind({"cmd"}, "3", function()
    launchOrFocusApp("Gather")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "3", function()
    launchOrFocusApp("Slack")
end)

hs.hotkey.bind({"cmd"}, "4", function()
    launchOrFocusApp("GitKraken")
end)

hs.hotkey.bind({"cmd"}, "5", function()
    launchOrFocusApp("Microsoft Outlook")
end)

hs.hotkey.bind({"cmd"}, "6", function()
    launchOrFocusApp("Postman")
end)

hs.hotkey.bind({"cmd"}, "7", function()
    launchOrFocusApp("Datagrip")
end)
