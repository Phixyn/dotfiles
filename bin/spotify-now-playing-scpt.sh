#!/usr/bin/env bash
#
# Get Spotify song and state with AppleScript, echo information and show
# notification on song change.
#
# Author: Phixyn (Alpeche Pancha)
# Version: 1.1.0

song=""
artist=""
tempsong=""
state=""
tempstate="playing"

while [ true ]; do
  # Grab current song and artist
  song=$(osascript -e "tell application \"Spotify\" to name of current track as string")
  artist=$(osascript -e "tell application \"Spotify\" to artist of current track as string")
  state=$(osascript -e "tell application \"Spotify\" to player state as string")

  # Notify with song and artist, if song is new
  # TODO: also check artist, because there's songs with same names :)
  if [ "$song" != "$tempsong" ]; then
    tempsong=$song
    osascript -e "display notification \"$artist\" with title \"$song\""
    echo "[$(date +%H:%M)] Now playing: $artist - $song"
  fi

  # Check if player state changed and echo new state.
  if [ "$state" != "$tempstate" ]; then
    tempstate=$state
    if [ "$state" == "paused" ]; then
      echo "[$(date +%H:%M)] ❙❙ Song paused."
    elif [ "$state" == "stopped" ]; then
      echo "[$(date +%H:%M)] ■ Player stopped."
    elif [ "$state" == "playing" ]; then
      echo "[$(date +%H:%M)] ▶ Song resumed."
    fi
  fi

  # Check every five seconds
  sleep 5
done
