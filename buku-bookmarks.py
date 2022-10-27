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

# Documentation:
# @raycast.description Searches your Buku bookmarks.
# @raycast.author Harvey Rogers
# @raycast.authorURL https://github.com/harveyr


from pathlib import Path
import sqlite3
import sys
from typing import List

query = sys.argv[1]

# TBD: Use `buku` instead of reading the db manually? Need to figure out the best
# invocation.

# TBD: DB path on other systems.
db_path = Path.home() / ".local/share/buku/bookmarks.db"

con = sqlite3.connect(db_path)
cur = con.cursor()

parts = query.split()
parts_count = len(parts)
sql_query_parts = ["select id, URL, metadata from bookmarks"]
sql_params: List[str] = []
for i, part in enumerate(parts):
    sql_params.append(f"%{part}%")
    if i == 0:
        sql_query_parts.append("where metadata like ?")
    else:
        sql_query_parts.append("and metadata like ?")


sql_query = " ".join(sql_query_parts)

for row in cur.execute(sql_query, sql_params):
    rid, url, title = row
    print(f"[{rid}] {title}\n{url}\n\n")

con.close()
