"""iTerm script to fetch and display Spotify's current playing song
in a status bar component.
"""


__author__ = "Phixyn (Alpeche Pancha)"
__version__ = "1.1.0"


import iterm2
import subprocess


get_song_cmd = [
    "osascript",
    "-e",
    'tell application "Spotify" to name of current track as string'
]
get_artist_cmd = [
    "osascript",
    "-e",
    'tell application "Spotify" to artist of current track as string'
]
get_spotify_state = [
    "osascript",
    "-e",
    'tell application "Spotify" to player state'
]

temp_song = ""


async def main(connection):
    app = await iterm2.async_get_app(connection)
    component = iterm2.StatusBarComponent(
        short_description="Spotify Now Playing",
        detailed_description="Shows your currently playing Spotify song and artist",
        knobs=[],
        exemplar="▶ Grimes - REALiTi",
        update_cadence=5,
        identifier="com.phixyn.nixes.spotify-now-playing")

    async def poll_spotify():
        # There might not be a current session, so there might be an exception
        # while trying to get it.
        try:
            session = app.current_terminal_window.current_tab.current_session
        except:
            return

        try:
            song = subprocess.run(
                get_song_cmd,
                check=True,
                capture_output=True,
                timeout=5,
                text=True).stdout.strip()
            artist = subprocess.run(
                get_artist_cmd,
                check=True,
                capture_output=True,
                timeout=5,
                text=True).stdout.strip()
        except subprocess.CalledProcessError as ex:
            song = None
            artist = None
            print("Could not get song name or artist from Spotify process.")
            print(ex)

        try:
            state = subprocess.run(
                get_spotify_state,
                check=True,
                capture_output=True,
                timeout=5,
                text=True).stdout.strip()
        except subprocess.CalledProcessError as ex:
            state = "stopped"
            print("Could not get player state from Spotify process. Defaulting to stopped.")
            print(ex)

        # Individual sessions may have a stale song name. We need to keep track of the
        # current song ourselves.
        global temp_song
        if song != temp_song:
            temp_song = song

        await session.async_set_variable("user.currentSong", song)
        await session.async_set_variable("user.currentArtist", artist)
        await session.async_set_variable("user.currentState", state)

    # This function gets called whenever any of the paths named in defaults (below) changes
    # or its configuration changes.
    # References specify paths to external variables (like current_song) and binds them to
    # arguments to the registered function (coro). When any of those variables' values
    # change the function gets called.
    @iterm2.StatusBarRPC
    async def coro(
        knobs,
        current_song=iterm2.Reference("user.currentSong?"),
        current_artist=iterm2.Reference("user.currentArtist?"),
        current_state=iterm2.Reference("user.currentState?")
    ):
        if (not current_artist and not current_song) or \
            (current_state == "stopped" or not current_state):
            return "■ Not playing"
        elif current_state == "paused":
            # return "❚ ❚ {} - {}".format(current_artist, current_song)
            return "❙ ❙ {} - {}".format(current_artist, current_song)
        else:
            return "▶ {} - {}".format(current_artist, current_song)

    # Register the status bar component.
    await component.async_register(connection, coro)

    while True:
        # Monitor Spotify
        await poll_spotify()

iterm2.run_forever(main)
