#!/bin/zsh
# === Place machine specific zsh settings here.

export LANG=en_US.UTF-8

# == Aliases settings
alias cdp='cd ~/project/'
alias cdlets='cd ~/project/lets'

# Homebrew settings
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true

export PATH=/opt/homebrew/bin:$PATH

# == Path settings
export PATH=$HOME/usr/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/mysql/bin

export NODE_PATH=/usr/local/lib/node_modules
# export MANPATH="/usr/local/man:$MANPATH"

# Machine related aliases
unalias fd
alias nv='nvim'

# nvim related
export XDG_CONFIG_HOME=~/.config/
export XDG_DATA_HOME=~/.config/

# Golang related
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN

# Python
# export PATH=$PATH:~/Library/Python/2.7/bin
export PATH=$PATH:/Users/biran/Library/Python/3.8/bin

# sqlite & openssl
export PATH=/usr/local/opt/sqlite/bin:$PATH
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH

# Java related
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.10.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export MAVEN_HOME=$HOME/apache-maven-3.6.3
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin

# flutter related
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
#export FLUTTER_STORAGE_BASE_URL=https://mirrors.sjtug.sjtu.edu.cn
#export PUB_HOSTED_URL=https://dart-pub.mirrors.sjtug.sjtu.edu.cn
export PATH=$PATH:/opt/flutter/bin

# MongoDB related
export PATH=$PATH:$(brew --prefix)/Cellar/mongodb-community/5.0.3/bin

# Android NDK
#export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/android-ndk-r21b
#export NDK_HOME=$HOME/Library/Android/sdk/android-ndk-r21b

# For MacOS in Black Apple

# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/biran/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/biran/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/biran/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/biran/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# conda ran settings
conda deactivate

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# == fzf related
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOOGLE_APPLICATION_CREDENTIALS=/var/service/config/lets-368e9-firebase-adminsdk-mvkc9-0417e7c207.json

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/biran/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/biran/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/biran/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/biran/tools/google-cloud-sdk/completion.zsh.inc'; fi

