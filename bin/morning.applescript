tell application "iTerm" to activate
tell application "System Events"
    tell process "iTerm2"
		click menu item "phix-dev-1" of menu of menu item "Restore Window Arrangement" of menu "Window" of menu bar 1
	end tell
end tell

delay 1

-- Start internal wiki on detached Screen
tell application "iTerm2"
    tell first tab of current window to select
    tell first session of first tab of current window
        write text "screen -S journal -t simiki"
        write text "cd $HOME/Documents/Journal"
        write text "source .env/bin/activate"
        write text "./start.sh"
    end tell
end tell

-- Detach from Screen
tell application "System Events"
    keystroke "a" using {control down}
    keystroke "d"
end tell

delay 1

-- Start 'URL Markify' on detached Screen
tell application "iTerm2"
    tell first tab of current window to select
    tell first session of first tab of current window
        write text "screen -S markify -t markify"
        write text "cd $HOME/Documents/Development/personal/python-scripts"
        write text "source .env/bin/activate"
        write text "./url_markify.py"
    end tell
end tell

tell application "System Events"
    keystroke "a" using {control down}
    keystroke "d"
end tell

delay 1

tell application "Spotify"
    activate
    play track "spotify:playlist:6hMBOevTHPxI9gzcMrcjHk"
    pause
end tell

delay 1

-- Start 'Spotify Now Playing' script
tell application "iTerm2"
    activate
    tell first tab of current window to select
    tell second session of first tab of current window
        select
        write text "screen -S now-playing -t Spotify"
        write text "clear ; $HOME/bin/mac-spotify-now-playing.sh"
    end tell
end tell

-- Start rest of applications
tell application "Dash" to activate
tell application "Slack" to activate
tell application "Firefox" to activate
tell application "RoboForm" to activate
tell application "Thunderbird" to activate
