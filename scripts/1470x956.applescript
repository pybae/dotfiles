#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title 1470x956
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Resizes window to 1470x956
# @raycast.author baepaul
# @raycast.authorURL x.com/baepaul

tell application "System Events"
    set frontApp to name of first application process whose frontmost is true
    tell application process frontApp
        set position of front window to {0, 0}
        set size of front window to {1470, 956}
    end tell
end tell
