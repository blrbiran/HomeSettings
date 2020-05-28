# === Place machine specific bash settings here.

# == PATH settings
export PATH=~/code/shell:~/usr/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:~/usr/lib/pkgconfig

# set jdk env
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=$PATH:${JAVA_HOME}/bin

# set go env
export GOROOT=$HOME/usr
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOBIN


# == autojump
[[ -s /usr/share/autojump/autojump.bash ]] && \
. /usr/share/autojump/autojump.sh

