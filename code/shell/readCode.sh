#!/bin/sh

bbcscope ()
{
    bbcg && \
    PWD= /bin/pwd && \
    local HERE=$PWD && \
    cscope -Rbq -P $HERE
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
        \cd $(bbgettop);
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP.";
        return 1;
    fi
}

bbgettop ()
{
    local TOPDIR=.git
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

