#!/usr/bin/env python3
# Use /path/to/replace-text.py /path/to/file 'old string with spaces' 'new string with spaces'

import sys
file = sys.argv[1]; old_string = sys.argv[2]; new_string = sys.argv[3]
with open(file) as src:
    lines = src.read()
print(lines.replace(old_string, new_string))
