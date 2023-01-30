#!/bin/sh

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
        \cd ${T};
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP.";
        return 1;
    fi
}

bbcgrepo ()
{
    T=$(bbgetrepotop);
    if [ "$T" ]; then
        \cd ${T};
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

