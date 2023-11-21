#!/bin/bash

#bbcscope ()
#{
    #bbcg && \
    #PWD= /bin/pwd && \
    #local HERE=$PWD && \
    #cscope -Rbkq -P $HERE
#}

#bbcurcscope ()
#{
    #PWD= /bin/pwd && \
    #local HERE=$PWD && \
    #cscope -Rbkq -P $HERE
#}

bballcscope ()
{
    bbcg && \
    find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -o -name "*.java" > cscope.files && \
    cscope -Rbkq -i cscope.files
}

bbcurcscope ()
{
    find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -o -name "*.java" > cscope.files && \
    cscope -Rbkq -i cscope.files
}

bbcscope ()
{
    find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -o -name "*.java" > cscope.files && \
    cscope -Rbkq -i cscope.files
}

bbctags ()
{
    bbcg && \
    ctags -R .
}

bbcg ()
{
    T=$(bbgettop);
    if [ "$T" ]; then
        if [ x"$1" = x"" ]; then
            \cd ${T};
        else
            \cd ${T}/$1
        fi
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP.";
        return 1;
    fi
}

bbcgrepo ()
{
    T=$(bbgetrepotop);
    if [ "$T" ]; then
        if [ x"$1" = x"" ]; then
            \cd ${T};
        else
            \cd ${T}/$1
        fi
    else
        echo "Couldn't locate the top of the repo tree.  Try setting TOP.";
        return 1;
    fi
}

bbgettop ()
{
    local TOPDIR=.git
    local TOP=""
    if [ -n "$TOP" -a -d "$TOP/$TOPDIR" ]; then
        ( cd $TOP;
        PWD= /bin/pwd );
    else
        if [ -d $TOPDIR ]; then
            PWD= /bin/pwd;
        else
            local HERE=$PWD;
            T=;
            while [ \( ! \( -d $TOPDIR \) \) -a \( $PWD != "/" \) ]; do
                \cd ..;
                T=`PWD= /bin/pwd -P`;
            done;
            \cd $HERE;
            if [ -d "$T/$TOPDIR" ]; then
                echo $T;
            fi;
        fi;
    fi
}

bbgetrepotop ()
{
    local TOPDIR=.repo
    local TOP=""
    if [ -n "$TOP" -a -d "$TOP/$TOPDIR" ]; then
        ( cd $TOP;
        PWD= /bin/pwd );
    else
        if [ -d $TOPDIR ]; then
            PWD= /bin/pwd;
        else
            local HERE=$PWD;
            T=;
            while [ \( ! \( -d $TOPDIR \) \) -a \( $PWD != "/" \) ]; do
                \cd ..;
                T=`PWD= /bin/pwd -P`;
            done;
            \cd $HERE;
            if [ -d "$T/$TOPDIR" ]; then
                echo $T;
            fi;
        fi;
    fi
}

#godir()
#{
#    if [[ -z "$1" ]]; then
#        echo "Usage: godir <regex>"
#        return
#    fi
#    #local T=$(gettop) #需要修改的
#    local T=$(pwd)
#    local FILELIST
#    if [ ! "$OUT_DIR" = "" ]; then
#        mkdir -p $OUT_DIR
#        FILELIST=$OUT_DIR/filelist
#    else
#        FILELIST=$T/filelist
#    fi
#    if [[ ! -f $FILELIST ]]; then
#        echo -n "Creating index..."
#        (\cd $T; find . -wholename ./out -prune -o -wholename ./.repo -prune -o -type f > $FILELIST)
#        echo " Done"
#        echo ""
#    fi
#    local lines
#    lines=($(grep "$1" $FILELIST | sed -e 's/\/[^/]*$//' | sort | uniq))
#    if [[ ${#lines[@]} = 0 ]]; then
#        echo "Not found"
#        return
#    fi
#    local pathname
#    local choice
#    if [[ ${#lines[@]} > 1 ]]; then
#        while [[ -z "$pathname" ]]; do
#            local index=1
#            local line
#            for line in ${lines[@]}; do
#                printf "%6s %s\n" "[$index]" $line
#                index=$(($index + 1))
#            done
#            echo
#            echo -n "Select one: "
#            unset choice
#            read choice
#            if [[ $choice -gt ${#lines[@]} || $choice -lt 1 ]]; then
#                echo "Invalid choice"
#                continue
#            fi
#            pathname=${lines[@]:$(($choice-1)):1}
#        done
#    else
#        pathname=${lines[@]:0:1}
#    fi
#    \cd $T/$pathname
#}
