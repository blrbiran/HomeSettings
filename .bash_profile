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
unalias grep
alias gc='grep -i --color=always'
alias gcr='grep -rni --color=always'
alias gcre='grep -rni --color=always -E'
alias gcrp='grep -rni --color=always -P'
alias h='history'
alias duc='du -h --max-depth=1'
alias vs='emacs'
alias vc='emacsclient'

alias sa='~/code/shell/searchFiles.sh'

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
