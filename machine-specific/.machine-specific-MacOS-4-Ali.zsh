#!/bin/zsh
# === Place machine specific zsh settings here.

export LANG=en_US.UTF-8

# == Aliases settings
alias cdp='cd ~/project/'
alias cdlets='cd ~/project/lets'
tt() {
  echo -e "\033];$1\007" ;
}
ttt() {
  tt $1 ; tmux a -t $1 ;
}

alias abb='adb -host'
alias abbr='adb -host remount'
alias abbd='adb -host devices'
alias abbs='adb -host shell'
alias abbpush='adb -host push'
alias abbpull='adb -host pull'

# Proxy setting
alias bbpxy='export http_proxy=socks5://localhost:13659'

# Xquartz X11 setting
export DISPLAY=:0

# == Path settings
export PATH=$HOME/usr/bin:/usr/local/bin:$PATH
#export PATH=$PATH:/usr/local/mysql/bin

export NODE_PATH=/usr/local/lib/node_modules
# export MANPATH="/usr/local/man:$MANPATH"

# Homebrew settings
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true

export PATH=/opt/homebrew/bin:$PATH

# Machine related aliases
#unalias fd
#alias nv='nvim'

# nvim related
#export XDG_CONFIG_HOME=~/.config/
#export XDG_DATA_HOME=~/.config/

# Golang related
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN

# Python
# export PATH=$PATH:~/Library/Python/2.7/bin
#export PATH=$(brew --prefix)/opt/python3/bin:$PATH

# sqlite & openssl
#export PATH=/usr/local/opt/sqlite/bin:$PATH
export PATH=$(brew --prefix)/opt/openssl@1.1/bin:$PATH
#export LDFLAGS="-L$(brew --prefix)/opt/openssl@3/lib"
#export CPPFLAGS="-I$(brew --prefix)/opt/openssl@3/include"

# curl
export PATH=$(brew --prefix)/opt/curl/bin:$PATH

# Java related
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_321.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.0.2.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export MAVEN_HOME=$HOME/apache-maven-3.8.5
#export MAVEN_HOME=$HOME/apache-maven-3.6.3
export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

j8() {
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_321.jdk/Contents/Home ;
  export PATH=$JAVA_HOME/bin:$PATH ;
}

j11() {
  export JAVA_HOME=$(brew --prefix)/Cellar/openjdk@11/11.0.14.1 ;
  export PATH=$JAVA_HOME/bin:$PATH ;
}

# Jenkins
# To restart jenkins-lts after an upgrade:
#   brew services restart jenkins-lts
# Or, if you don't want/need a background service you can just run:
#   $(brew --prefix)/opt/openjdk@11/bin/java -Dmail.smtp.starttls.enable=true -jar $(brew --prefix)/opt/jenkins-lts/libexec/jenkins.war --httpListenAddress=127.0.0.1 --httpPort=8085
export JENKINS_URL=http://localhost:8085/

# Ali ADB
export PATH=$PATH:${HOME}/work/CloudSparrow
export PATH=$PATH:${HOME}/work/CloudSparrow/ADB/mac:/opt/tools/platform-tools

# flutter related
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
#export FLUTTER_STORAGE_BASE_URL=https://mirrors.sjtug.sjtu.edu.cn
#export PUB_HOSTED_URL=https://dart-pub.mirrors.sjtug.sjtu.edu.cn
export PATH=$PATH:/opt/flutter/bin

# MongoDB related
# To start mongodb/brew/mongodb-community now and restart at login:
#   brew services start mongodb/brew/mongodb-community
# Or, if you don't want/need a background service you can just run:
#   mongod --config $(brew --prefix)/etc/mongod.conf

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1

function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
    export PS1="$(powerline-shell $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
fi

[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# == fzf related
# Install fzf: $(brew --prefix)/opt/fzf/install
[ -f ${HOME}/.fzf.zsh ] && source ${HOME}/.fzf.zsh

