#!/bin/bash
pac=$(set -o pipefail; checkupdates | wc -l);
if [ $? -ne 0 ]; then
	pac="E"
fi

aur=$(set -o pipefail; auracle sync | wc -l);
if [ $? -ne 0 ]; then
	pac="E"
fi

echo "$pac %{F#5b5b5b}%{F-} $aur"
