#!/usr/bin/env python3
"""
https://gist.githubusercontent.com/WoLpH/8b6f697ecc06318004728b8c0127d9b3/raw/250eb2e3f2acca1c51aa52adf611ec0380291e8a/colortest.py

for zshrc
"""

from __future__ import print_function

import os
import shutil
import subprocess


def get_width(default=80):
    """Attempt to detect console width and default to 80"""
    try:
        columns, _ = shutil.get_terminal_size()
    except AttributeError:
        try:
            _, columns = subprocess.check_output(["stty", "size"]).split()
        except OSError:
            columns = os.environ.get("COLUMNS", default)

    columns = int(columns) - 77
    # Since we have 6 columns with 1 space on each side, we can increment the
    # size for every 12 extra columns

    return max(0, columns / 12)


# Loosely based on https://gist.github.com/justinabrahms/1047767
colored = [0] + list(range(95, 256, 40))
colored_palette = [(r, g, b) for r in colored for g in colored for b in colored]


grayscale_palette = [(g, g, g) for g in range(8, 240, 10)]


ESC = "\033["
# Reset all colors sequence
RESET = ESC + "0m"
# Regular color
NORMAL = ESC + "38;5;{i}m"
# Bold color
BOLD = ESC + "1;" + NORMAL
# Background color
BACKGROUND = ESC + "48;5;{i}m"

PATTERN = (
    "{NORMAL}{BACKGROUND}{padding:^{width}}{i:^3d} "  # pad the background
    "{r:02X}/{g:02X}/{b:02X}"  # show the hex rgb code
    "{padding:^{width}}"  # pad the background on the other side
    "{RESET}"  # reset again
)

base_context = dict(RESET=RESET, padding="", width=get_width())

for i, (r, g, b) in enumerate(colored_palette + grayscale_palette, 16):
    context = dict(i=i, r=r, g=g, b=b, color=r + g + b, **base_context)
    context.update(BOLD=BOLD.format(**context))
    context.update(BACKGROUND=BACKGROUND.format(**context))

    # Change text color from black to white when it might become unreadable

    if max(r, g, b) > 0xCC:
        context.update(NORMAL=NORMAL.format(i=0))
    else:
        context.update(NORMAL=NORMAL.format(i=255))

    print(PATTERN.format(**context), end="")

    # Print newlines when needed

    if i % 6 == 3:
        print()
    else:
        print(" ", end="")
