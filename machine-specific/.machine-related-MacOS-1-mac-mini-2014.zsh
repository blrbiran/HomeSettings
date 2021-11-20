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

export PATH=$HOME/bin:/usr/local/bin:$PATH

export NODE_PATH=/usr/local/lib/node_modules

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOBIN
export PATH=$PATH:/usr/local/mysql/bin

# export PATH=$PATH:~/Library/Python/2.7/bin
export PATH=$PATH:/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin
# export MANPATH="/usr/local/man:$MANPATH"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

export HADOOP_HOME=/usr/local/hadoop-2.7.3
export HADOOP_HOME_WARN_SUPPRESS=1
export PATH=$PATH:$HADOOP_HOME/bin

export SCALA_HOME=/usr/local/share/scala
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$SCALA_HOME/bin:$SPARK_HOME/bin

alias hstart="$HADOOP_HOME/sbin/start-dfs.sh;$HADOOP_HOME/sbin/start-yarn.sh"
alias hstop="$HADOOP_HOME/sbin/stop-dfs.sh;$HADOOP_HOME/sbin/stop-yarn.sh"
alias sstart="$SPARK_HOME/sbin/start-all.sh"
alias sstop="$SPARK_HOME/sbin/stop-all.sh"

export LANG=en_US.UTF-8

#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_NO_AUTO_UPDATE=true

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

#export PUB_HOSTED_URL=https://pub.flutter-io.cn
#export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
export PATH=$PATH:$HOME/flutter-sdk/bin
