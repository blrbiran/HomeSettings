alias ls=' ls'
alias cd=' cd'
alias pcp='rsync --progress -arh'
# alias pcp='time rsync --progress -ah'
alias sl='exa -l --git'
alias sll='exa -l'
alias ba='bat --theme="OneHalfDark"'

if [[ "$(uname)" = "Darwin" ]]; then # MacOS
  alias ll='ls -alh -G'
else # Linux
  alias ll='ls -alh --color'
  alias lll='ls -lh --color'
fi
alias llc="ls -alh | tail --lines +4 | awk '{now=strftime(\"%-d\",systime()); {if(\$7==(now)) { print }}}'"
alias llcfiles="ls -alh | tail --lines +4 | awk '{now=strftime(\"%-d\",systime()); {if(\$7==(now)) { print }}}' | tail --lines +3 | awk '{printf \"%s \",\$9}'"
function llafter() {
DSTTIME=$1
ls -alh | awk -v dsttime="$1" '{if($8>=(dsttime)) { print }}' ;
echo $1 ;
}
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias cd1='cd.'
alias cd2='cd..'
alias cd3='cd...'
alias cd4='cd....'
alias cd5='cd.... ; cd.'
alias cd6='cd.... ; cd..'
alias cd7='cd.... ; cd...'
alias cd8='cd.... ; cd....'
mkcd() { mkdir -p $1 ; cd $1 ; }

unalias grep 2>/dev/null
alias gc='grep -i --color=auto'
alias gcr='grep -rni --color=auto'
alias gcrng='grep -rni --color=auto --exclude-dir={.git}'
alias gcre='grep -rni --color=auto -E'
alias gcrp='grep -rni --color=auto -P'
function cgc()
{
if [ "1" = "0" ]; then
	find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
	-exec grep --color -ni "$@" {} +
else
	find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
	-exec rg --color=auto -i --vimgrep "$@" {} +
fi
}
alias rgh="rg --hidden --glob '!.git'"
function vrg() {
	RANDOM_NAME=$(echo $RANDOM | md5sum | head -c 20; echo ;)
	RG_FILTER_PREFIX=/tmp/vim_fzf_${RANDOM_NAME} ;
	rg --vimgrep $@ > ${RG_FILTER_PREFIX}_0.txt &
	RG_FILTER_TARGET=$(rg --vimgrep $@ | fzf --preview "~/code/shell/fzf_preview.sh {}") && \
	echo ${RG_FILTER_TARGET} > ${RG_FILTER_PREFIX}.txt && \
	grep -v "${RG_FILTER_TARGET}" ${RG_FILTER_PREFIX}_0.txt >> ${RG_FILTER_PREFIX}.txt && \
	vim -q ${RG_FILTER_PREFIX}.txt ;
	rm -vf ${RG_FILTER_PREFIX}_0.txt ${RG_FILTER_PREFIX}.txt ;
}
function vrgh() {
	vrg --hidden --glob '!.git' $@
}

alias ta='tmux -f ~/.tmux.conf attach -t'
alias tl='tmux -L zsh list-sessions | sed "s/^/[zsh] /g"; tmux -L bash list-sessions | sed "s/^/[bash] /g"'
alias ts='tmux -f ~/.tmux.conf -L zsh new-session -s'
alias pp='tmux popup -w 90% -h 90%  "tmux attach -t popup || tmux new -s popup"'

unalias gg 2>/dev/null
alias gg='git'
alias ggbi='git remote -v && git branch -a | head -n 20 && echo "" && git branch -a | grep "\->"'
alias ggs='git status'
alias ggb='git branch'
alias ggba='git branch -a'
alias ggbd='git branch -d'
alias ggc='git commit'
alias ggca='git commit --amend'
alias ggco='git checkout'
alias ggcp='git cherry-pick'
alias ggrbi='git rebase -i'
ggrb() { git rebase -i HEAD~$1 ; }
alias ggdf='git diff'
alias ggdfc='git diff --cached'
alias ggll='git ll'
alias ggl='git ls'
alias ggstash='git stash'
alias ggsh='git show'
alias gga3='git am -3 < '
ggrb() { git rebase -i HEAD~$1 ; }

# == fzf
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
alias fcd='cd $(find . -type d | fzf)'
alias fvi='vi $(find . -type f | fzf)'
alias fgco='git checkout $(git branch | fzf)'
alias fgcor='git checkout $(git branch -r | fzf)'

alias fdn='find . -iname'
alias frn='find / -iname'
alias fff='find . \( -type f -o -type l \) -iname'
# fdd() { find . \( -name ".git" -o -name ".repo" \) -prune -o -type d -iname $1 -print ; }
# fdl() { find . \( -name ".git" -o -name ".repo" \) -prune -o -type l -iname $1 -print ; }
# fdf() { find . \( -name ".git" -o -name ".repo" \) -prune -o \( -type f -o -type l \) -iname $1 -print ; }
# fdff() { find . \( -name ".git" -o -name ".repo" -o -name "out" -o -name "build" -o -name "tmp" \) -prune -o \( -type f -o -type l \) -iname $1 -print ; }
fdd() { find . \( -name ".git" -o -name ".repo" \) -prune -o -type d -iname $@ ; }
fdl() { find . \( -name ".git" -o -name ".repo" \) -prune -o -type l -iname $@ ; }
fdf() { find . \( -name ".git" -o -name ".repo" \) -prune -o \( -type f -o -type l \) -iname $@ ; }
fdff() { find . \( -name ".git" -o -name ".repo" -o -name "out" -o -name "build" -o -name "tmp" \) -prune -o \( -type f -o -type l \) -iname $@ ; }

alias lc='ll | grep -i --color=auto'
alias lsc='ls | grep -i'
alias resh='source ~/.bash_profile'
alias esh='vim ~/.bash_profile ~/.machine-specific.bash'
alias rebash='source ~/.bash_profile'
alias rebashe='vim ~/.bash_profile ~/.machine-specific.bash'
alias h='history'
alias ht='history | tail -n '
psefb() { [[ "$1" == "a"  ]] && { ps -ef | head -n 1 && ps -ef | tail -n +2 | sort -rnk4 ;  } || { ps -ef | head -n 1 && ps -ef | tail -n +2 | sort -rnk4 | head -n 20 ;  }  }
#alias p='ps -f'
alias p='ps -ef --sort -pcpu | head -n 20'
alias psef='ps -ef --sort -pcpu'
alias psaux='ps -aux --sort -pcpu'
alias duc='du -h --max-depth=1'
alias vs='emacs'
alias vc='emacsclient'
alias cdconfig='bbcg1 ./arch/arm64/configs/'
alias cdconfig32='bbcg1 ./arch/arm/configs/'
alias cdusb='bbcg1 ./drivers/usb/'
alias vvusb='bbcg1 && tmux send-keys -t $(tmux display-message -p "#S") "vi ./drivers/usb/"'
alias cdgadget='bbcg1 ./drivers/usb/gadget/'
alias vvgadget='bbcg1 && tmux send-keys -t $(tmux display-message -p "#S") "vi ./drivers/usb/gadget/"'
alias cdspi='bbcg1 ./drivers/spi/'
alias cdrtc='bbcg1 ./drivers/rtc/'
alias vvrtc='bbcg1 && tmux send-keys -t $(tmux display-message -p "#S") "vi ./drivers/rtc/"'
alias cdmfd='bbcg1 ./drivers/mfd/'
alias vvmfd='bbcg1 && tmux send-keys -t $(tmux display-message -p "#S") "vi ./drivers/mfd/"'
alias cdinc='bbcg1 ./include/'
alias cdinclinux='bbcg1 ./include/linux/'

alias vipure='vim -u NONE'
alias bbconf='vim ~/.bash_profile ~/.zshrc ~/.vimrc'
alias bbviewcode='source ~/code/shell/readCode.sh'
#alias bbvdiff='vim -c "call BinaryDiff()" -O'
bbvdiff() {
  vimdiff -u NONE -N <(xxd $1) <(xxd $2);
}
alias bbcr='source ~/code/shell/readCode.sh'
alias cdd0='source ~/code/shell/readCode.sh ; bbcg ..'
alias cdd='source ~/code/shell/readCode.sh ; bbcg'
alias cdd1='source ~/code/shell/readCode.sh ; bbcg'
alias cdd2='source ~/code/shell/readCode.sh ; bbcgrepo'
alias cdd3='source ~/code/shell/readCode.sh ; bbcgrepo ..'
alias bbcg0='source ~/code/shell/readCode.sh ; bbcg ..'
alias bbcg1='source ~/code/shell/readCode.sh ; bbcg'
alias bbcg2='source ~/code/shell/readCode.sh ; bbcgrepo'
alias bbccs='source ~/code/shell/readCode.sh ; bbcurcscope'
alias bbgodir='source ~/code/shell/readCode.sh ; godir '
alias bbtagsc='ctags -R --c-kinds=+p --fields=+aS --extra=+q .'
alias bbtagscpp='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .'
alias csd='cscope -d'
alias cdu='source ~/code/shell/cdmisc.sh ; cdup'
alias rcd='cd ${PWD}'
alias bbc='BCURDIR=${PWD} ; source ~/code/shell/readCode.sh ; bbcgrepo ; BWORKDIR=${PWD} ; cd ${BCURDIR}'
bbtarx() { pv ${1} | tar -xz ; }
# bbtarx() { tar -xz --checkpoint=.100 ${1} ; }

tt() { printf "\033];%s\007\n" $1 ; }
bbcp() {
echo "cp $1/$3 $2/$3" ;
cp $1/$3 $2/$3 ; }
bbcpr() {
echo "cp -rf $1/$3 $2/$3/../" ;
cp -r $1/$3 $2/$3 ; }
bbkdiff3() { kdiff3 $1/$3 $2/$3 ; }
bbdiff() { diff -q $1/$3 $2/$3 ; }
bbmeld() { meld $1/$3 $2/$3 ; }
bbmeldc() { cur=${PWD} ;
if [ "$2" == "" ];then
	meld $cur/ $1/ ;
else
	meld $cur/$2 $1/$2 ;
fi ; }
bbv() { var=$*;file=${var%%:*};tmp=${var#*:};line=${tmp%%:*};
	vi_para=$file" +"$line;echo $vi_para; vi $vi_para ; }
bb2ack() { ack "$1" -l | xargs -I {} ack "$2" {} -H ; }
bbfgcr() { var=$* ;
	find . -type f -name $1 | xargs grep -ni --color=auto ${var#*\ } ; }
bbvgcr() { vi $(grep -rni -P "$1" -l) ; }
bbvlc() { vi $(ls | grep "$1") ; }

# Useless bb
bbhmost() { cat ~/.bash_history | awk '{sub(/^[^;]*;/,"",$0);print $0}' | \
	LC_ALL=C sort | uniq -c | LC_ALL=C sort -rn | head -n 20 ; }
bbhgc() { cat ~/.bash_history | awk '{sub(/^[^;]*;/,"",$0);print $0}' | \
	grep -i "$1" | uniq -c | sort -n ; }

tgz() { tar -czvf ${1}.tgz ${1} ; }
alias untgz='tar -xzvf'

# set bash as vi mode
set -o vi
# set -o emacs
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
# go into command mode
bind -m vi-insert '\c-h':vi-movement-mode
# clear screen
bind -m vi-insert '\c-l':clear-screen
# jump to start
bind -m vi-insert '\c-j':beginning-of-line
# jump to end
bind -m vi-insert '\c-e':end-of-line
bind -m vi-insert '\c-k':end-of-line
# jump to later word
bind -m vi-insert '\c-b':backward-word
# jump to former word
bind -m vi-insert '\c-f':forward-word


# Load machine specific settings
SPECIFIC_SETTING_PATH=~/.machine-specific.bash
if [ -f ${SPECIFIC_SETTING_PATH} ];then
	source ${SPECIFIC_SETTING_PATH}
else
	echo "Please touch ${SPECIFIC_SETTING_PATH} to define machine specific settings."
fi
