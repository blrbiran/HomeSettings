
\. ${HOME}/.machine-specific.common.sh

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
#[[ -s $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # This loads nvm bash_completion

# Rust settings
# export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
# source "$HOME/.cargo/env"
# export PATH="$HOME/.cargo/bin:$PATH"

#bind 'set show-all-if-unmodified on'
#bind 'set bell-style none'
#bind 'TAB:menu-complete'

# == function complete
# https://www.gnu.org/software/bash/manual/html_node/A-Programmable-Completion-Example.html
#complete -o filenames -o nospace -o bashdefault -F _comp_cd c
#complete -o nospace -F _comp_cd c
