#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Daily Obsidian Note (Work)
# @raycast.mode silent
# @raycast.packageName Obsidian
#
# Optional parameters:
# @raycast.icon ✍
#
# Documentation:
# @raycast.description Opens daily note in Obsidian in my work vault
# @raycast.author Harvey Rogers
# @raycast.authorURL https://github.com/harveyr

set -o errexit
set -o nounset
set -o pipefail

date=$(date +%F)
obsidian_path="obsidian://open?vault=Google&file=Daily%2F$date"

open "$obsidian_path"