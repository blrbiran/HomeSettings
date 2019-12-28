#!/bin/sh

cdup ()
{
    local opwd=$(pwd)
    local IN
    echo "PWD:"$opwd
    read -n 1 -p "cd.(Y/n)" IN
    while [ "$IN" = "y" ]; do
        cd ..
        local HERE=$(pwd)
        echo ${HERE}
        read -n 1 -p "cd.(Y/n)" IN
    done;
    if [ "$IN" = "n" ]; then
        cd $opwd
    fi
}
