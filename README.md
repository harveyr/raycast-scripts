# My Raycast Script Commands

[Raycast](https://www.raycast.com/)
allows you to add extensions via
[script commands](https://github.com/raycast/script-commands).
Here's my fledgling collection.

## [buku-bookmarks.py](buku-bookmarks.py)

This command queries my
[buku](https://github.com/jarun/buku)
database and presents the results.
It's a quick way to get at my bookmarks.

## [chrome-add-to-things.py](chrome-add-to-things.py)

This command adds the active Chrome tab to my
[Things](https://culturedcode.com/things/)
inbox.
The task title is the webpage title,
and the page URL is added to the task notes.

## [chrome-markdown-link.sh](chrome-markdown-link.sh)

This command gives me a Markdown link to the current Chrome tab.
It uses Applescript to get the tab's title and URL,
and then pops the link on your clipboard.