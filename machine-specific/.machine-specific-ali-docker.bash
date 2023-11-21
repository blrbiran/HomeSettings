#!/bin/bash
# === Place machine specific bash settings here.

# == aliases and functions
alias ll='ls -alFh'
alias upb=''
alias upp=''
alias cdb='cd /workspace/codebase/'
alias cdp='cd /workspace/codebase/repos'
alias cdc='cd ~/workspace/'
alias cdxmake='bbcg2 ./xmake/'
alias cdvendor='bbcg2 ./vendor/'
alias cdvr='bbcg2 ./vendor/renesas/'
alias cdvrl='bbcg2 ./vendor/renesas/bsp/linux/'
alias cdvm='bbcg2 ./vendor/mtk/'
alias cdvml='bbcg2 ./vendor/mtk/linux/'
alias cdvq='bbcg2 ./vendor/qcom/'
alias cdvql='bbcg2 ./vendor/qcom/bsp/linux/'
alias cdvs='bbcg2 ./vendor/samsung/'
alias cdvsl='bbcg2 ./vendor/samsung/bsp/linux/'
alias cdvd='bbcg2 ./vendor/smdrv/'
alias cdvdb='bbcg2 ./vendor/smdrv/bsp/'
alias cdvdl='bbcg2 ./vendor/smdrv/bsp/linux/'
alias cdrfs='bbcg2 ./out/platforms/*/target/rootfs/'
alias cdobj='bbcg2 ./out/platforms/*/target/obj/'
alias cdobjlib='bbcg2 ./out/platforms/*/target/obj/SHARED_LIBRARY/LINKED/'
alias cdobjbin='bbcg2 ./out/platforms/*/target/obj/EXECUTABLE/LINKED/'
alias cdweston='bbcg2 ./framework/nativeservice/utopiad'
alias cdmap='bbcg2 ./apps/map/'
alias cdmap1='bbcg2 ./apps/mapsdk/'
alias cdmap2='bbcg2 ./framework/npm/map_paas_components/'
alias cdmap3='bbcg2 ./aliyunos/apps/XMap/'
vimanifest() {
pushd . && bbcg2 ;
MANIFEST_FOLDER=${PWD}/.repo/manifest.xml ;
pushd +1 ;
vi ${MANIFEST_FOLDER} ;
}
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
bbx9hpyocto() {
	# Setup Semidrive toolchain
	export PATH=$PATH:/tool/gcc_linaro/gcc-arm-none-eabi-7.3.1/bin:/tool/gcc_linaro/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-elf/bin ;
}
#alias xxxmake='pushd . && bbcg2 xmake && change_node.sh v8.10.0 && . xmake.sh'
alias xxxmake='pushd . && bbcg2 xmake && . xmake.sh'
xxmakesop2() {
XXMAKE_BUILD_PROJ="rcarh3n_user"
if [ "$1" == "user" ]; then
	XXMAKE_BUILD_PROJ="rcarh3n_user"
elif [ "$1" == "eng" ]; then
	XXMAKE_BUILD_PROJ="rcarh3n_eng"
fi
pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 ;
}
xxmakesamsung() {
XXMAKE_BUILD_PROJ="exynosauto_eng"
if [ "$1" == "user" ]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [ "$1" == "eng" ]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=EP33L && pushd +1 ;
}
xxmakesamsung_multi() {
XXMAKE_BUILD_PROJ="exynosauto_user"
if [ "$1" == "user" ]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [ "$1" == "eng" ]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=EP33L --with-permission=no --enable-android-core && pushd +1 ;
}
xxmakelx() {
XXMAKE_BUILD_PROJ="sa8155_user"
if [ "$1" == "user" ]; then
	XXMAKE_BUILD_PROJ="sa8155_user"
elif [ "$1" == "eng" ]; then
	XXMAKE_BUILD_PROJ="sa8155_eng"
fi
pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --enable-android-core --with-cartype=EP33L && pushd +1 ;
}
xxmakevs7() {
XXMAKE_BUILD_PROJ="rcarm3_user"
if [ "$1" == "user" ]; then
	XXMAKE_BUILD_PROJ="rcarm3_user"
elif [ "$1" == "eng" ]; then
	XXMAKE_BUILD_PROJ="rcarm3_eng"
elif [ "$1" == "prod" ]; then
	XXMAKE_BUILD_PROJ="rcarm3_user --with-platform_mode=P --enable-prod_mode=yes --with-fourgmod_version="
fi
pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 ;
}
xxmakevs8() {
XXMAKE_BUILD_PROJ="x9m_user"
if [ "$1" == "user" ]; then
	XXMAKE_BUILD_PROJ="x9m_user"
elif [ "$1" == "eng" ]; then
	XXMAKE_BUILD_PROJ="x9m_eng"
fi
XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-mapactivate=N"
pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 ;
}
alias xxmake='xxmakevs8'
alias xxpkg='pushd . && bbcg2 xmake && . xdirs && xmake image-stripped'
cdpl() {
. ~/code/shell/readCode.sh && bbcgrepo ./vendor/mediatek/proprietary/bootable/bootloader/preloader/ ;
if [ "$?" == "1" ];then
	echo "no common preloader folder, try another"
	cd ./bootable/bootloader/preloader-mtk/
fi ; }
cdlk() {
. ~/code/shell/readCode.sh && bbcgrepo ./vendor/mediatek/proprietary/bootable/bootloader/lk/ ;
if [ "$?" == "1" ];then
	echo "no common lk folder, try another"
	cd ./bootable/bootloader/lk-mtk/
fi ; }
alias cddts='bbcg1 ./arch/arm64/boot/dts/'
alias cddts32='bbcg1 ./arch/arm/boot/dts/'
alias cdusb20='bbcg1 ./drivers/misc/mediatek/usb20/'
alias vvusb20='bbcg1 && tmux send-keys -t $(tmux display-message -p "#S") "vi ./drivers/misc/mediatek/usb20/"'
alias cdmtk='bbcg1 ./drivers/misc/mediatek/'

#alias bbdf='df -h | gc -vP "worktmp(?=/)"'
alias bbdf='df -h'
bbln() {
	BB_FOLDER_NAME=$(echo $1 | cut -d "/" -f1)
	echo "ln -s ${PWD}/${BB_FOLDER_NAME} ${BB_FOLDER_NAME}_$2"
	ln -s ${PWD}/${BB_FOLDER_NAME} ${BB_FOLDER_NAME}_$2
}
bbrmyocbuild() { mkdir old && mv build/ sstate-cache/ old ; \
	echo "start rm old folder" && rm -rf old ; }
bbpush1() { git push yunos HEAD:refs/for/$1 ; }
bbpush() {
REMOTE_NAME=$(echo $1 | rev | cut -d"/" -f2- | rev)
BRANCH_NAME=$(echo $1 | rev | cut -d"/" -f1 | rev)
echo "git push ${REMOTE_NAME} HEAD:refs/for/${BRANCH_NAME}"
git push ${REMOTE_NAME} HEAD:refs/for/${BRANCH_NAME}
}
bbtoolsvs7() {
	export TOOLS_VS7=/workspace/codebase/repos/toolchain/vs7/aarch64-poky-linux-7.3-glibc-2.27 ;
	export PATH=$TOOLS_VS7/bin:$PATH ;
}
bbcc() {
	#sudo update-alternatives --install /usr/local/bin/gcc gcc /usr/bin/gcc-5 50 ;
	#sudo update-alternatives --install /usr/local/bin/gcc gcc /usr/bin/gcc-4.9 49 ;
	#sudo update-alternatives --install /usr/local/bin/g++ g++ /usr/bin/g++-5 50 ;
	#sudo update-alternatives --install /usr/local/bin/g++ g++ /usr/bin/g++-4.9 49 ;
	#sudo update-alternatives --config gcc ;
	#sudo update-alternatives --config g++ ;
	if [ "$1" == "49" ]; then
		sudo update-alternatives --set gcc /usr/bin/gcc-4.9 ;
		sudo update-alternatives --set g++ /usr/bin/g++-4.9 ;
	elif [ "$1" == "50" ]; then
		sudo update-alternatives --set gcc /usr/bin/gcc-5 ;
		sudo update-alternatives --set g++ /usr/bin/g++-5 ;
	fi
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
export PATH=~/bin:~/usr/bin:~/code/shell:~/code/localshell:/workspace/home/usr/bin:$PATH

# == Python path
#export PYTHONPATH=/worktmp/home/usr/lib/python2.7/site-packages

# == autojump
[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh

#export NVM_DIR="$HOME/.nvm"
#[[ -s $NVM_DIR/nvm.sh ]] && . $NVM_DIR/nvm.sh # This loads nvm
#[[ -s $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # This loads nvm bash_completion

[[ -s ${HOME}/.bashrc ]] && . ${HOME}/.bashrc

# Rust settings
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
source "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

# auto complete like zsh
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set colored-stats on'
bind 'set history-preserve-point on'

#bind 'set show-all-if-unmodified on'
#bind 'set bell-style none'
#bind 'TAB:menu-complete'

# == function complete
# https://www.gnu.org/software/bash/manual/html_node/A-Programmable-Completion-Example.html
#complete -o filenames -o nospace -o bashdefault -F _comp_cd c
#complete -o nospace -F _comp_cd c

COMPLETE_SCRIPT_FILE=~/usr/complete/rg.bash
[[ -s "$COMPLETE_SCRIPT_FILE" ]] && . ${COMPLETE_SCRIPT_FILE}
#complete -F _rg -o bashdefault -o default rg
#complete -F _rg -o bashdefault -o default cgc
complete -F _rg -o bashdefault -o default cgc

COMPLETE_SCRIPT_FILE=~/usr/complete/exa.bash
[[ -s "$COMPLETE_SCRIPT_FILE" ]] && . ${COMPLETE_SCRIPT_FILE}
#complete -o filenames -o bashdefault -F _exa sl
#complete -o filenames -o bashdefault -F _exa slg

[[ -s ${HOME}/.fzf.bash ]] && . ${HOME}/.fzf.bash
