alias cd=' cd'
alias ls=' ls'

if [[ "$(uname)" = "Darwin" ]]; then # MacOS
  alias ll='ls -alh -G'
else # Linux
  alias ll='ls -alh --color'
fi
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias cd2='cd..'
alias cd3='cd...'
alias cd4='cd....'
alias cd5='cd.... ; cd.'
alias cd6='cd.... ; cd..'
alias cd7='cd.... ; cd...'
alias cd8='cd.... ; cd....'

unalias grep
alias gc='grep -i --color=auto'
alias gcr='grep -rni --color=auto'
alias gcrng='grep -rni --color=auto --exclude-dir={.git}'
alias gcre='grep -rni --color=auto -E'
alias gcrp='grep -rni --color=auto -P'

alias ta='tmux -f ~/.tmux.conf attach -t'
alias tab='tmux -f ~/.tmux.conf.bash attach -t'
alias tl='tmux -L zsh list-sessions | sed "s/^/[zsh] /g"; tmux -L bash list-sessions | sed "s/^/[bash] /g"'
alias ts='tmux -f ~/.tmux.conf -L zsh new-session -s'
alias tsb='tmux -f ~/.tmux.conf.bash -L bash new-session -s'

unalias gg
alias gg='git'
alias ggbi='git remote -v && git branch -a | head -n 10 && echo "" && git branch -a | grep "\->"'
alias ggs='git status'
alias ggb='git branch'
alias ggba='git branch -a'
alias ggbd='git branch -d'
alias ggc='git commit'
alias ggca='git commit --amend'
alias ggco='git checkout'
alias ggcp='git cherry-pick'
alias ggrbi='git rebase -i'
alias ggdf='git diff'
alias ggdfc='git diff --cached'
alias ggll='git ll'
alias ggl='git ls'
alias ggstash='git stash'

alias fdn='find . -name'
alias lc='ll | grep --color=auto'
alias lsc='ls | grep '
alias rebash='source ~/.bash_profile'
alias h='history'
alias duc='du -h --max-depth=1'
alias vs='emacs'
alias vc='emacsclient'

alias bbviewcode='source ~/code/shell/readCode.sh'
alias bbcr='source ~/code/shell/readCode.sh'
alias bbcg1='source ~/code/shell/readCode.sh ; bbcg'
bbmeld() { meld $1/$3 $2/$3 ; }
bbv() { var=$*;file=${var%%:*};tmp=${var#*:};line=${tmp%%:*};vi_para=$file" +"$line;echo $vi_para; vi $vi_para ; }
bbfgcr() { var=$* ; find . -type f -name $1 | xargs grep -ni --color=auto ${var#*\ } ; }
bbvgcr() { vi $(grep -rni -P "$1" -l) ; }

# Useless bb
bbhmost() { cat ~/.bash_history | sort | uniq -c | sort -rn | head -n 10 ; }

PATH=~/code/shell:~/usr/bin:$PATH
export $PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:~/usr/lib/pkgconfig

# set bash as vi mode
set -o vi
# set -o emacs
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
# go into command mode
bind -m vi-insert '\c-h':vi-movement-mode
# clear screen
bind -m vi-insert '\c-l':clear-screen
# go into command mode
bind -m vi-insert '\c-e':end-of-line
# go into command mode
bind -m vi-insert '\c-a':beginning-of-line
# go into command mode
bind -m vi-insert '\c-b':backward-mode
# go into command mode
bind -m vi-insert '\c-f':forward-mode

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

