#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create a new journal entry
# @raycast.mode silent
# @raycast.packageName Google Docs
#
# Optional parameters:
# @raycast.icon ✍️
#
# Documentation:
# @raycast.author Harvey Rogers
# @raycast.authorURL https://github.com/harveyr

FOLDER_ID="1ezN9OmjQU4Da1Y28rhbgmGF_WFyOMjJq"

title=$(date +%F)

url="https://docs.google.com/document/create?usp=drive_web&folder=$FOLDER_ID&title=$title"

open "$url"