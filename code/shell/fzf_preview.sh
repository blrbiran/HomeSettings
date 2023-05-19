#!/bin/sh

FILENAME=$(echo $1 | awk -F':' '{printf "%s", $1}')
LINE=$(echo $1 | awk -F':' '{printf "%s", $2}')
if [ "0" = "1" ]; then
	tail --lines=+$LINE $FILENAME
else
	SHOWLINE=0
	if [ "$LINE" -gt "3" ]; then
		SHOWLINE=$(expr $LINE - 3)
	fi
	#echo "showline:$SHOWLINE, line:$LINE"
	bat --line-range=$SHOWLINE:+200 --highlight-line=$LINE --theme="OneHalfDark" --style=numbers --color=always $FILENAME
fi
