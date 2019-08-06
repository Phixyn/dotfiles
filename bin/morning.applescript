tell application "iTerm" to activate
tell application "System Events"
    tell process "iTerm2"
		click menu item "phix-dev-1" of menu of menu item "Restore Window Arrangement" of menu "Window" of menu bar 1
	end tell
end tell

tell application "Spotify"
    activate
    play track "spotify:user:phixyn:playlist:0NRHACYvNdIIMScnNfFUAL"
    pause
end tell
tell application "System Events" to tell process "Spotify" to set position of window 1 to {1050, 680}

tell application "Slack" to activate
tell application "Firefox" to activate
tell application "Thunderbird" to activate
