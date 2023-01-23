#!/usr/bin/env python3

import subprocess
from urllib import parse


def main():
    url: str = (
        subprocess.check_output(["osascript", "lib/print-chrome-url"])
        .decode("utf-8")
        .strip()
    )
    title: str = (
        subprocess.check_output(["osascript", "lib/print-chrome-title"])
        .decode("utf-8")
        .strip()
    )

    parsed_url = parse.urlparse(url)
    trimmed_url = get_trimmed_url(parsed_url)

    title += f" - {parsed_url.hostname}"

    if url != trimmed_url:
        notes = f"- Original: {url}\n- Trimmed: {trimmed_url}"
    else:
        notes = url

    payload = {"title": title, "notes": notes}

    things_qs = parse.urlencode(payload, quote_via=parse.quote)
    things_url = f"things:///add?{things_qs}"

    subprocess.check_call(["open", things_url])


def get_trimmed_url(parsed: parse.ParseResult) -> str:
    query_parsed = parse.parse_qs(parsed.query)

    trimmed_query = {}

    for key, val in query_parsed.items():
        if key.startswith("utm_"):
            continue

        trimmed_query[key] = val

    new_qs = parse.urlencode(trimmed_query)

    return parsed._replace(fragment="", query=new_qs).geturl()


if __name__ == "__main__":
    main()
