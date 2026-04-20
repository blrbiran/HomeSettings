
\. ${HOME}/.machine-specific.common.sh

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
	# PS1="$(last-command-prompt)\[\e[1;36m\]\W$(git-branch-prompt)\[\e[0m\] "
	PS1="$(last-command-prompt)\[\e[1;36m\]\W\[\e[0m\] "
}
PROMPT_COMMAND=set-bash-prompt

export TERM=screen-256color

# == PATH settings
export PATH=~/bin:~/usr/bin:~/code/shell:~/code/localshell:/workspace/home/usr/bin:$PATH

# == REPO settings
#export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

# == Python path
#export PYTHONPATH=/worktmp/home/usr/lib/python2.7/site-packages

# == autojump
[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh

export NVM_DIR="$HOME/.nvm"
[[ -s $NVM_DIR/nvm.sh ]] && . $NVM_DIR/nvm.sh # This loads nvm
[[ -s $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # This loads nvm bash_completion

#[[ -s ${HOME}/.bashrc ]] && . ${HOME}/.bashrc

# Rust settings
# export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
# source "$HOME/.cargo/env"
# export PATH="$HOME/.cargo/bin:$PATH"

# auto complete like zsh
#bind 'set show-all-if-ambiguous on'
#bind 'set completion-ignore-case on'
#bind 'set colored-stats on'
#bind 'set history-preserve-point on'

#bind 'set show-all-if-unmodified on'
#bind 'set bell-style none'
#bind 'TAB:menu-complete'

# == function complete
# https://www.gnu.org/software/bash/manual/html_node/A-Programmable-Completion-Example.html
#complete -o filenames -o nospace -o bashdefault -F _comp_cd c
#complete -o nospace -F _comp_cd c

#COMPLETE_SCRIPT_FILE=~/usr/complete/rg.bash
#[[ -s "$COMPLETE_SCRIPT_FILE" ]] && . ${COMPLETE_SCRIPT_FILE}
#complete -F _rg -o bashdefault -o default rg
#complete -F _rg -o bashdefault -o default cgc
#complete -F _rg -o bashdefault -o default cgc

#COMPLETE_SCRIPT_FILE=~/usr/complete/exa.bash
#[[ -s "$COMPLETE_SCRIPT_FILE" ]] && . ${COMPLETE_SCRIPT_FILE}
#complete -o filenames -o bashdefault -F _exa sl
#complete -o filenames -o bashdefault -F _exa slg

_get_recent_history() {
    local cur prev words cword
    _init_completion || return
    local commands
    commands_list=$(history | tail -n 5)
    if [[ x"$cur" == x"" ]]; then
        echo -e "\n$commands_list"
    fi
    commands=$(echo -e "$commands_list" | awk '{print "!" $1}')
    # return complete options
    COMPREPLY=($(compgen -W "$commands" -- "${COMP_WORDS[COMP_CWORD]}"))
    #COMPREPLY=($(compgen -f "$commands" -- "${COMP_WORDS[COMP_CWORD]}"))
} && complete -F _get_recent_history sudoh

my_sudo_command() {
    # 获取当前输入的内容
    # current_input=$(cat <<< "$(history 0 | tail -n 1 | sed 's/^[ ]*[0-9][0-9]*[ ]*//')")
    # current_input=$(cat <<< "$(history 0)")
    # current_input=$(history 0)
    # current_input=$(fc -ln -0)
    # echo -e "$current_input" > /tmp/test.txt
    # 清除开头的空格
    # current_input=$(echo "$current_input" | sed 's/^[\t ]*//')
    current_input=""

    # 检查当前输入内容是否为空
    if [[ x"$current_input" == x"" ]]; then
        # 获取最近的历史命令
        last_command=$(history 1 | sed 's/^[ \t]*[0-9][0-9]*[ ]*//')
        input_to_edit="sudo $last_command"
    else
        input_to_edit="sudo $current_input"
    fi

    # 用新内容替换当前输入
    READLINE_LINE="$input_to_edit"
    READLINE_POINT=${#input_to_edit}
}

#bind -x '"\C-t": my_sudo_command'

#[[ -s ${HOME}/.fzf.bash ]] && . ${HOME}/.fzf.bash

# Install ble.sh
# git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
# make -C ble.sh install PREFIX=~/.local/blesh
# echo 'source [[ -s ${HOME}/.local/blesh/share/blesh/ble.sh  ]] && . ${HOME}/.local/blesh/share/blesh/ble.sh' >> ~/.bashrc
#[[ -s ${HOME}/.local/blesh/share/blesh/ble.sh ]] && . ${HOME}/.local/blesh/share/blesh/ble.sh

