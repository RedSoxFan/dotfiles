#!/usr/bin/bash

SOX=$(~/.local/share/bin/mlb 2>/dev/null)
PATS=$(~/.local/share/bin/nfl --today 2>/dev/null)

echo -e $SOX"         "$PATS | sed -r "s/^\s+|\s+$//g"
