#!/bin/bash
# === Place machine specific bash settings here.

# == PS1 settings
#PS1="[\u@\h \W]\$"
prompt_git=y
function last-command-prompt {
	if [ $? == 0 ];then
		printf "\[\e[1;32m\]➔ "
	else
		printf "\[\e[1;31m\]✘ "
	fi
}
function git-branch-prompt {
	if [ ${prompt_git} == "y" ];then
		branch=$(git symbolic-ref --short -q HEAD 2>/dev/null)
	fi
	# if branch exist
	if [ $branch ];then
		status=$(git status -uno 2>/dev/null)
		# git dirty status
		if [[ ${status} =~ "nothing to commit" ]];then
			state=""
		elif [[ ${status} =~ "Changes to be committed" ]];then
			state="\[\e[0;33m\] ●"
		fi
		if [[ ${status} =~ "Changes not staged for commit" ]];then
			if [[ "${state}" == "" ]];then
				state="\[\e[0;33m\] ✚"
			else
				state+="✚"
			fi
		fi
		echo "\[\e[1;34m\](\[\e[0;33m\] \[\e[1;31m\]${branch}\[\e[1;34m\])${state}"
	fi
}
function set-bash-prompt {
	PS1="$(last-command-prompt)\[\e[1;36m\]\W$(git-branch-prompt)\[\e[0m\] "
}
#PROMPT_COMMAND=set-bash-prompt

# Aliases
#alias bbpxy='export http_proxy=socks5h://127.0.0.1:8081 ; export https_proxy=socks5h://127.0.0.1:8081'
alias bbpxy='export http_proxy=socks5h://192.168.3.31:8889 ; export https_proxy=socks5h://192.168.3.31:8889'
#alias bbpxy='export http_proxy=http://192.168.3.31:8888 ; export https_proxy=https://192.168.3.31:8888'

# == PATH settings
export PATH=~/code/shell:~/usr/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:~/usr/lib/pkgconfig

# == GPU settings
export PATH=/usr/local/cuda-11.5/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/cuda-11.5/lib64:${LD_LIBRARY_PATH}

# == Python settings
export PATH=${PATH}:~/.local/bin

# set jdk env
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=$PATH:${JAVA_HOME}/bin

# set go env
export GOROOT=$HOME/usr/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
#export GO15VENDOREXPERIMENT=1
export GO111MODULE=on
export PATH=$HOME/usr/go/bin:$GOBIN:$PATH
export GOPROXY=https://goproxy.cn
#export GOPROXY=https://mirrors.aliyun.com/goproxy/
export GOSUMDB=off
#export GOPRIVATE=github.com/blrbiran


# == autojump
[[ -s /usr/share/autojump/autojump.bash ]] && \
. /usr/share/autojump/autojump.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/biran/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/biran/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/biran/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/biran/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

