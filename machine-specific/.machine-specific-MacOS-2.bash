#!/bin/bash
# === Place machine specific bash settings here.

# == PS1 settings
#PS1="[\u@\h \W]\$"
function git-branch-prompt {
	local branch=$(git symbolic-ref --short -q HEAD 2>/dev/null)
	if [ $branch ]; then
		printf "\e[0;34m(\e[0;31m%s\e[0;34m)" ${branch}
	fi
}
function set-bash-prompt {
	PS1="\e[0;34mNerd@\e[0;32m\W $(git-branch-prompt)\e[0;35m \$\e[0m"
}
PROMPT_COMMAND=set-bash-prompt

# == PATH settings
export PATH=~/code/shell:~/usr/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:~/usr/lib/pkgconfig

# == added by Anaconda3 2019.03 installer
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


# == ruby related settings
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# == fzf related
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

