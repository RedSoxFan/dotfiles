#!/usr/bin/bash

# Commented out for the offseason
# SOX=$(~/.local/share/bin/mlb 2>/dev/null)
SOX=""
PATS=$(~/.local/share/bin/nfl --today 2>/dev/null)

echo -e $SOX"         "$PATS | sed -r "s/^\s+|\s+$//g"
