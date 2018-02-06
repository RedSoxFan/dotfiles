#!/usr/bin/bash

SOX=$(~/.local/share/bin/mlb 2>/dev/null)
# Commented out for the offseason
# PATS=$(~/.local/share/bin/nfl --today 2>/dev/null)
PATS=""

echo -e $SOX"         "$PATS | sed -r "s/^\s+|\s+$//g"
