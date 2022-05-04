#!/bin/bash
# === Place machine specific bash settings here.

# == aliases and functions
alias llc="ll | awk '{now=strftime(\"%d\",systime()); {if(\$7==(now)) { print }}}'"
alias upb=''
alias upp=''
alias cdb='cd /workspace/codebase/'
alias cdc='cd ~/workspace/'
alias cdvendor='bbcg2 && cd ./vendor/'
alias cdvr='bbcg2 && cd ./vendor/renesas'
alias cdvm='bbcg2 && cd ./vendor/mtk'
alias csrcmake='pushd . && bbcg2 && cd xmake && change_node.sh v8.10.0 && . xmake.sh'
cdpl() {
. ~/code/shell/readCode.sh && bbcgrepo && \
cd ./vendor/mediatek/proprietary/bootable/bootloader/preloader/ ;
if [ "$?" == "1" ];then
	echo "no common preloader folder, try another"
	cd ./bootable/bootloader/preloader-mtk/
fi ; }
cdlk() {
. ~/code/shell/readCode.sh && bbcgrepo && \
cd ./vendor/mediatek/proprietary/bootable/bootloader/lk/ ;
if [ "$?" == "1" ];then
	echo "no common lk folder, try another"
	cd ./bootable/bootloader/lk-mtk/
fi ; }
alias cddts='bbcg1 && cd ./arch/arm64/boot/dts/'
alias cddts32='bbcg1 && cd ./arch/arm/boot/dts/'
alias cdusb20='bbcg1 && cd ./drivers/misc/mediatek/usb20/'
alias vvusb20='bbcg1 && tmux send-keys -t $(tmux display-message -p "#S") "vi ./drivers/misc/mediatek/usb20/"'
alias cdmtk='bbcg1 && cd ./drivers/misc/mediatek/'

#alias bbdf='df -h | gc -vP "worktmp(?=/)"'
alias bbdf='df -h'
bbrmyocbuild() { mkdir old && mv build/ sstate-cache/ old ; \
	echo "start rm old folder" && rm -rf old ; }
bbpush() { git push mediatek HEAD:refs/for/$1 ; }
bbcl() { cas-labels -b alps-mp-$1 ; }
bbct() { s1=( $(sed -r "s/(alps)-(mp|dev|trunk)-([0-9a-z.]*)-/\3-$2-/g" <<< "$1"));
cas-take $1 -n $s1 ;
}
bbct2() {
s0=( $(grep --color=auto -Po "(?<=alps-mp-)[a-zA-Z0-9.\-_]*" <<< "$1") ) ;
s1=( $(grep --color=auto -Eo "[a-zA-Z0-9.]*-" <<< "$s0" ) ) ;
s2=$s1$2-${s0:${#s1}:${#s0}} ; cas-take $1 -n $s2 ; }
bbct3() { cas-take alps-mp-$1 -n $2 ; }
bbup() { ls $* | xargs -I {} mtkbuild -o . -l -i -d -x {} ; }

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
PROMPT_COMMAND=set-bash-prompt

# == PATH settings
export PATH=~/bin:~/usr/bin:$~/code/shell:/workspace/home/usr/bin:$PATH

# == Python path
#export PYTHONPATH=/worktmp/home/usr/lib/python2.7/site-packages

# == autojump
[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh

[ -s ${HOME}/.fzf.bash ]] && . ${HOME}/.fzf.bash

[[ -s ${HOME}/.bashrc ]] && . ${HOME}/.bashrc