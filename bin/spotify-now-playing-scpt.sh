#!/usr/bin/env bash
#
# Uses AppleScript to display a notification with the artist and name of the
# current Spotify song.

song=""
artist=""
tempsong=""

while [ true ]; do
  # Grab current song and artist
  song=$(osascript -e "tell application \"Spotify\" to name of current track as string")
  artist=$(osascript -e "tell application \"Spotify\" to artist of current track as string")

  # Notify with song and artist, if song is new
  # TODO: also check artist, because there's songs with same names :)
  if [ "$song" != "$tempsong" ]; then
    tempsong=$song
    osascript -e "display notification \"$artist\" with title \"$song\""
    echo "[$(date +%H:%M)] Now playing: $artist - $song"
  fi 

  # Check every five seconds
  sleep 5
done
