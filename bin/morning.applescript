tell application "iTerm" to activate
tell application "System Events"
    tell process "iTerm2"
		click menu item "phix-dev-1" of menu of menu item "Restore Window Arrangement" of menu "Window" of menu bar 1
	end tell
end tell

delay 1

tell application "iTerm2"
    tell first session of current tab of current window
        select
        write text "screen -S Journal"
        write text "cd $HOME/Documents/Journal"
        write text "source .env/bin/activate"
        write text "./start.sh"
    end tell
end tell

tell application "System Events" to keystroke "a" using {control down}
tell application "System Events" to keystroke "d"

tell application "Spotify"
    activate
    play track "spotify:playlist:6hMBOevTHPxI9gzcMrcjHk"
    pause
end tell

tell application "iTerm2"
    tell second session of first tab of current window
        select
        write text "screen -S Now-Playing"
        write text "clear ; $HOME/bin/mac-spotify-now-playing.sh"
    end tell
end tell

tell application "Dash" to activate
tell application "Slack" to activate
tell application "Firefox" to activate
tell application "RoboForm" to activate
tell application "Thunderbird" to activate
