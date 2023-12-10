function launchOrFocusApp(appName)
    hs.application.launchOrFocus(appName)
end

hs.hotkey.bind({"ctrl"}, "'", function()
    launchOrFocusApp("iTerm")
end)

hs.hotkey.bind({"cmd"}, "1", function()
    launchOrFocusApp("Visual Studio Code - Insiders")
end)

hs.hotkey.bind({"cmd"}, "2", function()
    launchOrFocusApp("Arc")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "2", function()
    launchOrFocusApp("Google Chrome")
end)

hs.hotkey.bind({"cmd"}, "3", function()
    launchOrFocusApp("Slack")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "3", function()
    launchOrFocusApp("Discord")

end)

hs.hotkey.bind({"cmd"}, "4", function()
    launchOrFocusApp("GitKraken")
end)

hs.hotkey.bind({"cmd"}, "5", function()
    launchOrFocusApp("Microsoft Outlook")
end)

hs.hotkey.bind({"cmd"}, "6", function()
    launchOrFocusApp("Notion")
end)