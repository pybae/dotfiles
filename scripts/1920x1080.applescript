#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title 1920x1080
# @raycast.mode compact

# Optional parameters:
# @raycast.icon =إ��

# Documentation:
# @raycast.description Resizes window to 1920x1080
# @raycast.author baepaul
# @raycast.authorURL x.com/baepaul
#

tell application "System Events"
    set frontApp to name of first application process whose frontmost is true
    tell application process frontApp
        set position of front window to {0, 0}
        set size of front window to {1920, 1080}
    end tell
end tell
