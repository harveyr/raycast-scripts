#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Journal (Obsidian)
# @raycast.mode silent
# @raycast.packageName Obsidian
#
# Optional parameters:
# @raycast.icon ✍
#
# Documentation:
# @raycast.description Opens journal vault in Obsidian
# @raycast.author Harvey Rogers
# @raycast.authorURL https://github.com/harveyr

set -o errexit
set -o nounset
set -o pipefail

open "obsidian://open?vault=Journal"