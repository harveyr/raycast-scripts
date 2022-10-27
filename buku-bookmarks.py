#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Buku Bookmarks
# @raycast.mode fullOutput
# @raycast.packageName Buku

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Query" }

from pathlib import Path
import sqlite3
import sys

query = sys.argv[1]

db_path = Path.home() / ".local/share/buku/bookmarks.db"

con = sqlite3.connect(db_path)
cur = con.cursor()

for row in cur.execute(
    "select URL, metadata from bookmarks where metadata like ?", (f"%{query}%", )
):
    url, title = row
    print(f"{title}\n{url}\n\n")

con.close()
