#!/bin/zsh
# === Place machine specific zsh settings here.

export LANG=en_US.UTF-8

# == Aliases settings
alias cdp='cd ~/work/Project/'
alias cdload='cd ~/load'
tt() {
  echo -e "\033];$1\007" ;
}
ttt() {
  tt $1 ; tmux a -t $1 ;
}

alias rcp='rsync -Wav --progress'
alias sshg="sshpass -p 'root' ssh"
alias scpg="sshpass -p 'root' scp -O"
alias abb='adb -host'
alias abbr='adb -host remount'
alias abben="adb -host shell \"echo 'enable n;' > /proc/alog\" && adb -host remount "
alias abbd='adb -host devices'
alias abbs="adb -host wait-for-device && adb -host shell \"echo 'enable n;' > /proc/alog\" && adb -host remount && adb -host shell"
alias abbss='adb -host shell'
alias abbpush='adb -host push'
alias abbpull='adb -host pull'
alias abbdis='adb -host disconnect'
abbc() {
if [[ "$2" == "" ]];then
  adb -host connect $1:8888 ;
else
  adb -host connect $1:$2 ;
fi
}
alias bbrgzkernelinit='rg "Booting Linux on physical CPU 0x0" -z *_kernellog.txt.zst'
function bbrg() {
	local print_cmd=false
	local always_color=""
	local with_less=""
	while getopts "ncl" opt; do
		case $opt in
			n) print_cmd=true ;;
			c) always_color="--color=always" ;;
			l) always_color="--color=always" ; with_less=" | less" ;;
		esac
	done
	shift $((OPTIND-1))
	local filename_short="$1"
	shift
	local sort_option="-j1"
	# local sort_option="--sort-files"
	local rg_cmd="rg ${sort_option} $@ -z ${always_color} *${filename_short}*.txt* ${with_less}"
	eval $rg_cmd
	if $print_cmd; then
		echo "Search result as above, command: ${rg_cmd}"
	fi
}

# Proxy setting
alias bbpxy='export http_proxy=socks5h://127.0.0.1:13659 ; export https_proxy=socks5h://127.0.0.1:13659'

# Xquartz X11 setting
export DISPLAY=:0

# == Path settings
export PATH=$HOME/usr/bin:/usr/local/bin:$PATH
#export PATH=$PATH:/usr/local/mysql/bin

export NODE_PATH=/usr/local/lib/node_modules
# export MANPATH="/usr/local/man:$MANPATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Homebrew settings
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
export HOMEBREW_NO_AUTO_UPDATE=true

export PATH=/opt/homebrew/bin:$PATH

# Machine related aliases
#unalias fd
#alias nv='nvim'

# nvim related
#export XDG_CONFIG_HOME=~/.config/
#export XDG_DATA_HOME=~/.config/

# Golang related
#export GOROOT=/usr/local/opt/go/libexec
export GOROOT=$(brew --prefix)/Cellar/go/1.20.7/libexec
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN
# go env -w GOPROXY="https://goproxy.cn,direct"

# Python
# export PATH=$PATH:~/Library/Python/2.7/bin
#export PATH=$(brew --prefix)/opt/python3/bin:$PATH

# pipx
export PATH="$PATH:~/.local/bin"

# Kotlin
export KOTLIN_HOME=$HOME/kotlin/kotlin-native-prebuilt-macos-aarch64-2.0.20
export PATH=$PATH:$KOTLIN_HOME/bin

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

# Rust settings
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
source "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

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
autoload -U compinit && compinit

# == fzf related
# Install fzf: $(brew --prefix)/opt/fzf/install
[ -f ${HOME}/.fzf.zsh ] && source ${HOME}/.fzf.zsh

# == fzf-tab related
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
enable-fzf-tab

# The fuck function
eval $(thefuck --alias)

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/banma-3431/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/banma-3431/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/banma-3431/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/banma-3431/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
