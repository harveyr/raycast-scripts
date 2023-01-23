#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Current URL as Markdown Link
# @raycast.mode silent
# @raycast.packageName Google Chrome
#
# Optional parameters:
# @raycast.icon 🌐
# Alternatives: ✍
#
# Documentation:
# @raycast.description Copies URL of current Chrome tab into clipboard as a Markdown link.
# @raycast.author Harvey Rogers
# @raycast.authorURL https://github.com/harveyr

# https://github.com/raycast/script-commands/blob/master/commands/browsing/chrome-current-page-url.sh
url=$(osascript lib/print-chrome-url)

# https://unix.stackexchange.com/questions/103252/how-do-i-get-a-websites-title-using-command-line
# title=$(wget -qO- "$url" | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si')

# https://stackoverflow.com/questions/5135609/can-applescript-access-browser-tabs-and-execute-javascript-in-them
title=$(osascript lib/print-chrome-title)

echo "[$title]($url)" | pbcopy

echo "Copied"