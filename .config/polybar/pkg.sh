#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(auracle sync | wc -l)

check=$((pac + aur))
echo "$pac %{F#5b5b5b}%{F-} $aur"
