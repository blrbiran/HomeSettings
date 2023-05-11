#!/bin/bash
# === Place machine specific bash settings here.

# == aliases and functions
alias ll='ls -alFh'
alias upb=''
alias upp=''
alias cdb='cd /workspace/codebase/'
alias cdp='cd /workspace/codebase/repos'
alias cdc='cd ~/workspace/'
alias cdvendor='bbcg2 && cd ./vendor/'
alias cdvr='bbcg2 && cd ./vendor/renesas/'
alias cdvrl='bbcg2 && cd ./vendor/renesas/bsp/linux/'
alias cdvm='bbcg2 && cd ./vendor/mtk/'
alias cdvml='bbcg2 && cd ./vendor/mtk/linux/'
alias cdvq='bbcg2 && cd ./vendor/qcom/'
alias cdvql='bbcg2 && cd ./vendor/qcom/bsp/linux/'
alias cdrfs='bbcg2 && cd ./out/platforms/*/target/rootfs/'
alias cdobj='bbcg2 && cd ./out/platforms/*/target/obj/'
alias cdmap='bbcg2 && cd ./apps/map/'
alias cdmap1='bbcg2 && cd ./apps/mapsdk/'
alias cdmap2='bbcg2 && cd ./framework/npm/map_paas_components/'
alias cdmap3='bbcg2 && cd ./aliyunos/apps/XMap/'
cdrepos() {
reIsNumber='^[0-9]+$'
PARSE_PATH=$(echo $1 | rev | cut -d"/" -f2- | rev)
PARSE_NAME=$(echo $1 | rev | cut -d"/" -f1 | rev)
if [[ "$2" == "" ]]; then
	echo "Print listed here:"
	ls -al $PARSE_PATH/ | grep $PARSE_NAME ;
elif [[ "$2" == "f" ]]; then
	ls -al $PARSE_PATH/ | grep $PARSE_NAME ;
	SELECT_NAME=$(ls -1 ${PARSE_PATH}/ | grep $PARSE_NAME | head -n 1) && cd ${PARSE_PATH}/${SELECT_NAME}
elif [[ "$2" == "l" ]]; then
	ls -al $PARSE_PATH/ | grep $PARSE_NAME ;
	SELECT_NAME=$(ls -1 ${PARSE_PATH}/ | grep $PARSE_NAME | tail -n 1) && cd ${PARSE_PATH}/${SELECT_NAME}
elif [[ "$2" =~ $reIsNumber ]] && [[ "$2" -ge "1"  ]] && [[ "$2" -le 9  ]]; then
	ls -al $PARSE_PATH/ | grep $PARSE_NAME ;
	SELECT_NAME=$(ls -1 ${PARSE_PATH}/ | grep $PARSE_NAME | head -n $2 | tail -n 1) && cd ${PARSE_PATH}/${SELECT_NAME}
else
	cd $1$2 ;
fi ; }
testint() {
value=6 ;
echo $1
reIsNumber='^[0-9]+$'
[[ "$1" =~ $reIsNumber ]] && { echo "number"; } || { echo "not a number"; }
if [ "$1" -ge "1" ] && [ "$1" -le 9 ]; then
	echo haha
fi ;
}
vs7() { cdrepos /workspace/codebase/repos/VS7_pbase_ivi_rcarm3_ $1 ; }
ep33l() { cdrepos /workspace/codebase/repos/EP33L_baseos_ivi_dev_android_poc_ $1 ; }
sop3() { cdrepos /workspace/codebase/repos/pbase_ivi_rcarh3n_ $1 ; }
yocto() { cdrepos /workspace/codebase/yocto/yocto_rcarm3_ $1 ; }

vs7bootmeta() { . ~/usr/bin/vs7_bootmeta.sh ; }
#alias xxxmake='pushd . && bbcg2 && cd xmake && change_node.sh v8.10.0 && . xmake.sh'
alias xxxmake='pushd . && bbcg2 && cd xmake && . xmake.sh'
xxmakesop2() {
XXMAKE_BUILD_PROJ="rcarh3n_user"
if [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="rcarh3n_eng"
fi
pushd . && bbcg2 && cd xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 ;
}
xxmake() {
XXMAKE_BUILD_PROJ="rcarm3_user"
if [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="rcarm3_eng"
fi
pushd . && bbcg2 && cd xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 ;
}
alias xxmakeprod='pushd . && bbcg2 && cd xmake && . xmake.sh rcarm3_user --with-platform_mode=P --enable-prod_mode=yes --with-fourgmod_version= && pushd +1'
alias xxpkg='pushd . && bbcg2 && cd xmake && . xdirs && xmake image-stripped'
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
bbpush1() { git push yunos HEAD:refs/for/$1 ; }
bbpush() {
REMOTE_NAME=$(echo $1 | rev | cut -d"/" -f2- | rev)
BRANCH_NAME=$(echo $1 | rev | cut -d"/" -f1 | rev)
echo "git push ${REMOTE_NAME} HEAD:refs/for/${BRANCH_NAME}"
git push ${REMOTE_NAME} HEAD:refs/for/${BRANCH_NAME}
}
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
bbtoolsvs7() {
	export TOOLS_VS7=/workspace/codebase/repos/toolchain/vs7/aarch64-poky-linux-7.3-glibc-2.27 ;
	export PATH=$TOOLS_VS7/bin:$PATH ;
}

alias abb='adb -host'
alias abbr='adb -host remount'
alias abben="adb -host remount && adb -host shell \"echo 'enable n;' > /proc/alog\""
alias abbd='adb -host devices'
alias abbs='adb -host shell'
alias abbpush='adb -host push'
alias abbpull='adb -host pull'
abbc() { adb -host connect $1:8888 ; }

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

[[ -s ${HOME}/.fzf.bash ]] && . ${HOME}/.fzf.bash

#export NVM_DIR="$HOME/.nvm"
#[[ -s $NVM_DIR/nvm.sh ]] && . $NVM_DIR/nvm.sh # This loads nvm
#[[ -s $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # This loads nvm bash_completion

[[ -s ${HOME}/.bashrc ]] && . ${HOME}/.bashrc
