#!/bin/zsh
# === Place machine specific zsh settings here.

export PATH=$HOME/bin:/usr/local/bin:$PATH

export GOROOT=$HOME/usr
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOBIN

# set jdk env
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=$PATH:${JAVA_HOME}/bin

export LANG=en_US.UTF-8

# nvim related
export XDG_CONFIG_HOME=~/.config/
export XDG_DATA_HOME=~/.config/

