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
alias ggbi='git remote -v && git branch -a | head -n 10'
alias ggs='git status'
alias ggb='git branch -a'
alias ggc='git commit'
alias ggca='git commit --amend'
alias ggco='git checkout'
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
bbmeld() { meld $1/$3 $2/$3 ; }
bbvig() { var=$*;file=${var%%:*};tmp=${var#*:};line=${tmp%%:*};vi_para=$file" +"$line;echo $vi_para; vi $vi_para ; }
bbgcr() { var=$* ; find . -type f -name $1 | xargs grep -ni --color=auto ${var#*\ } ; }
bbgcrpv() { vi $(gcrp $1 -l) ; }

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
