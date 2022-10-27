#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Current URL as Markdown Link
# @raycast.mode silent
# @raycast.packageName Google Chrome
#
# Optional parameters:
# @raycast.icon 🧭
#
# Documentation:
# @raycast.description Copies URL of current Chrome tab into clipboard as a Markdown link.
# @raycast.author Harvey Rogers
# @raycast.authorURL https://github.com/harveyr

url=$(osascript -e 'tell application "Google Chrome" to get URL of active tab of first window')

title=$(wget -qO- "$url" |
  perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si')

echo "[$title]($url)" | pbcopy

echo "Copied"