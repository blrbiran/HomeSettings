#!/bin/sh

FILENAME=$(echo $1 | awk -F':' '{printf "%s", $1}')
LINE=$(echo $1 | awk -F':' '{printf "%s", $2}')
tail --lines=+$LINE $FILENAME
