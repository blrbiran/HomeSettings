#!/bin/bash
# === Place machine specific bash settings here.

# == aliases and functions
alias upb='mtkbuild -o . -l -i'
alias upx='mtkbuild -o . -l -i -x'
alias upp='mtkbuild -o . -l -i -d -x'
alias cdb='cd /worktmp/codebase/'
alias cdc='cd ~/casws_mtk14576/'
alias cdvendor='bbcg2 && cd ./vendor/mediatek/proprietary/'
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
alias cddts='bbcg1 && cd ./arch/arm64/boot/dts/mediatek/'
alias cddts32='bbcg1 && cd ./arch/arm/boot/dts/mediatek/'
alias cdusb20='bbcg1 && cd ./drivers/misc/mediatek/usb20/'
alias vvusb20='bbcg1 && tmux send-keys -t $(tmux display-message -p "#S") "vi ./drivers/misc/mediatek/usb20/"'
alias cdusb11='bbcg1 && cd ./drivers/misc/mediatek/usb11/'
alias cdmtk='bbcg1 && cd ./drivers/misc/mediatek/'

alias yocas='export CAS_CONFIG=CONFIG_YOCTO_GCN_SPICE'
alias unyocas='unset CAS_CONFIG'
alias casrm='cas-remove'

alias bbdf='df -h | gc -vP "worktmp(?=/)"'
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
	if [ $branch ]; then
		status=$(git status -uno 2>/dev/null)
		#git dirty status
		if [[ ! ${status} =~ "working tree clean" ]];then
			state="\[\e[1;33m\] ✚"
		fi
		echo "\[\e[1;34m\](\[\e[0;33m\] \[\e[1;31m\]${branch}\[\e[1;34m\])${state}"
	fi
}
function set-bash-prompt {
	PS1="$(last-command-prompt)\[\e[1;36m\]\W$(git-branch-prompt)\[\e[0m\] "
}
PROMPT_COMMAND=set-bash-prompt

# == PATH settings
export PATH=~/bin:~/usr/bin:$~/code/shell:/worktmp/home/usr/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/worktmp/home/usr/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/worktmp/home/usr/lib/pkgconfig

if false; then
  # maven and build env setting
  if [ "`cat /etc/issue |grep 10.04`" != "" ]; then
    echo "10.04"
    export PATH=~/bin:/mtkoss/maven/3.2.1-ubuntu-10.04/x86_64/bin:/mtkoss/git/1.8.1-ubuntu-10.04/x86_64/bin:/mtkoss/jdk/1.6.0_34-ubuntu-10.04/x86_64/bin:/mtkoss/python/2.7.3-ubuntu-10.04/x86_64/bin:$PATH
  elif [ "`cat /etc/issue |grep 12.04`" != ""  ]; then
    echo "12.04"
    export PATH=~/bin:/mtkoss/maven/3.2.1-ubuntu-10.04/x86_64/bin:/mtkoss/git/1.8.1-ubuntu-12.04/x86_64/bin:/mtkoss/jdk/1.6.0_34-ubuntu-10.04/x86_64/bin:$PATH
  elif [ "`cat /etc/issue |grep 14.04`" != ""  ]; then
    echo "14.04"
    #export PATH=~/bin:/mtkoss/maven/3.2.1-ubuntu-10.04/x86_64/bin:/mtkoss/git/1.8.1-ubuntu-12.04/x86_64/bin:/mtkoss/jdk/1.6.0_34-ubuntu-10.04/x86_64/bin:$PATH
    export PATH=~/bin:/mtkoss/maven/3.2.1-ubuntu-10.04/x86_64/bin:/mtkoss/git/2.6.4-ubuntu-14.04/bin:/mtkoss/jdk/1.6.0_34-ubuntu-10.04/x86_64/bin:$PATH
  else
    echo "Unknown Version"
  fi
  export JAVA_HOME=/mtkoss/jdk/1.6.0_34-ubuntu-10.04/x86_64
  export ANDROID_JAVA_HOME=/mtkoss/jdk/1.6.0_34-ubuntu-10.04/x86_64
fi

alias repo='/mtkoss/git/mtk_repo'
export PATH=/mtkoss/git:$PATH
export PATH=.repo/repo:$PATH
export PATH=$PATH:/mtkoss/git/Jungle_scripts

# == P4 settings
export P4PORT=10.17.1.181:2008
export P4USER=ran.bi
source /mtktools/perforce/bash_p4

# == Python path
export PYTHONPATH=/worktmp/home/usr/lib/python2.7/site-packages

# == autojump
[[ -s /proj/mtk14576/.autojump/etc/profile.d/autojump.sh ]] && \
. /proj/mtk14576/.autojump/etc/profile.d/autojump.sh
