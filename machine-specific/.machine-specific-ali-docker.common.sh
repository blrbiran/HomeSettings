# === Place machine specific bash settings here.

# == aliases and functions
if [[ x"$(uname)" == x"Darwin" ]]; then # MacOS
  alias ll='ls -alh -G'
else # Linux
  alias ll='ls -alFh --color'
fi
unalias esh
alias esh='vim ~/.zshrc ~/.machine-specific.zsh ~/.machine-specific.common.sh ~/.bash_profile ~/.machine-specific.bash'
alias upb=''
alias upp=''
alias vcron='vi ~/code/localshell/autoRepoBuild.sh'
alias cdb='cd /workspace/codebase/'
alias cdp='cd /workspace/codebase/repos'
alias cdy='cd /workspace/codebase/yocto'
alias cdc='cd ~/workspace/'
alias cdxmake='bbcg2 ./xmake/'
alias cdvendor='bbcg2 ./vendor/'
alias cdvt='bbcg2 ./vendor/ti/'
alias cdvtc='bbcg2 ./vendor/ti/j7/'
alias cdvtl='bbcg2 ./vendor/ti/bsp/linux/'
alias cdvtb='bbcg2 ./vendor/ti/bsp/'
alias cdvb='bbcg2 ./vendor/bst/'
alias cdvbc='bbcg2 ./vendor/bst/c1200/'
alias cdvbl='bbcg2 ./vendor/bst/bsp/linux/'
alias cdvbb='bbcg2 ./vendor/bst/bsp/'
alias cdvr='bbcg2 ./vendor/renesas/'
alias cdvrc='bbcg2 ./vendor/renesas/rcarm3/'
alias cdvrl='bbcg2 ./vendor/renesas/bsp/linux/'
alias cdvm='bbcg2 ./vendor/mtk/'
alias cdvml='bbcg2 ./vendor/mtk/bsp/linux/'
alias cdvq='bbcg2 ./vendor/qcom/'
alias cdvqc='bbcg2 ./vendor/qcom/sa8*/'
alias cdvql='bbcg2 ./vendor/qcom/bsp/linux/'
alias cdvs='bbcg2 ./vendor/samsung/'
alias cdvsc='bbcg2 ./vendor/samsung/exynosauto/'
alias cdvsl='bbcg2 ./vendor/samsung/bsp/linux/'
alias cdvd='bbcg2 ./vendor/smdrv/'
alias cdvdc='bbcg2 ./vendor/smdrv/x9*/'
alias cdvdb='bbcg2 ./vendor/smdrv/bsp/'
alias cdvdl='bbcg2 ./vendor/smdrv/bsp/linux/'
alias cdvnc='bbcg2 ./vendor/nvidia/orin*/'
alias cdvnb='bbcg2 ./vendor/nvidia/bsp/'
alias cdvnl='bbcg2 ./vendor/nvidia/bsp/linux/'
alias cdrfs='bbcg2 ./out/platforms/*/target/rootfs/'
alias cdobj='bbcg2 ./out/platforms/*/target/obj/'
alias cdobjlib='bbcg2 ./out/platforms/*/target/obj/SHARED_LIBRARY/LINKED/'
alias cdobjbin='bbcg2 ./out/platforms/*/target/obj/EXECUTABLE/LINKED/'
alias cdlib='bbcg2 ./out/platforms/*/target/obj/SHARED_LIBRARY/LINKED/'
alias cdbin='bbcg2 ./out/platforms/*/target/obj/EXECUTABLE/LINKED/'
alias cdtc='bbcg2 ./prebuilts/gcc/linux-x86/aarch64/'
alias cdweston='bbcg2 ./framework/nativeservice/utopiad'
alias cdbootanim='bbcg2 ./app/bootanimation/'
alias cdmap='bbcg2 ./apps/map/'
alias cdmap1='bbcg2 ./apps/mapsdk/'
alias cdmap2='bbcg2 ./framework/npm/map_paas_components/'
alias cdmap3='bbcg2 ./aliyunos/apps/XMap/'
alias bbsync='~/code/localshell/autoRepoBuild.sh'
bbstrings() {
	find . -name "*.so" | xargs -I {} bash -c "echo {} ; strings {} | grep $1"
}
zp() {
	ZP_FOLDER=$1
	ZP_OUTPUT_PATH=zp_out
	if [[ -d $ZP_FOLDER ]];then
		echo "Folder name is ${ZP_FOLDER}" ;
		cd ${ZP_FOLDER} ;
		rm -rf .git ;
		cd ..
		mkdir ${ZP_OUTPUT_PATH}
		zip -r ${ZP_OUTPUT_PATH}/${ZP_FOLDER}.zip ${ZP_FOLDER}
	else
		echo "Folder not found" ;
	fi
}
bbcustvs8() {
	REPO_NAME=linux
	if [[ x"$1" != x"" ]];then
		REPO_NAME=$1
	fi
	git remote add custom https://gerrit-custom2.yunos.com/Banma/AVN/vendor/smdrv/bsp/${REPO_NAME} ;
	git fetch custom dev_smdrv_x9_vs8 && \
	git checkout custom/dev_smdrv_x9_vs8 -b cust_$(date +"%m%d") ;
}
bbcustva7() {
	REPO_NAME=linux
	if [[ x"$1" != x"" ]];then
		REPO_NAME=$1
	fi
	git remote add custom https://gerrit-custom2.yunos.com/code/os/vendor/renesas/bsp/source/${REPO_NAME} ;
	git fetch custom dev_renesas_bsp_mp4_va5 && \
	git checkout custom/dev_renesas_bsp_mp4_va5 -b cust_$(date +"%m%d") ;
}
bbcustcmp() {
	REPO_NAME=linux
	if [[ x"$1" != x"" ]];then
		REPO_NAME=$1
	fi
	git remote add custom https://gerrit-custom2.yunos.com/Banma/AVN/vendor/smdrv/bsp/${REPO_NAME} ;
	git fetch custom pbase_x9sp_cns3p_yf && \
	git checkout custom/pbase_x9sp_cns3p_yf -b cust_$(date +"%m%d") ;
}
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
if [[ "$1" -ge "1" ]] && [[ "$1" -le 9 ]]; then
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
#alias xxxmake='pushd . && bbcg2 xmake && . xmake.sh'
alias xxx='pushd . && bbcg2 xmake && . x && pushd +1 ;'
xxmakebash() {
tmp_rc=$(mktemp)
echo "\. ~/.bash_profile ; echo tmp: $tmp_rc ; $1 ; sleep 1 ; rm -rf $tmp_rc" > "$tmp_rc"
bash --rcfile "$tmp_rc" -i
}
xxmakerun() {
XXMAKE_BUILD_PROJ=$1
XXMAKERUNCMD="pushd . && source ~/code/shell/readCode.sh ; bbcgrepo xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 "
if [[ x"$2" == x"-n" ]]; then
	# echo "pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 ;"
	echo ${XXMAKERUNCMD}
else
	# pushd . && bbcg2 xmake && . xmake.sh ${XXMAKE_BUILD_PROJ} && pushd +1 ;
	if [ -n "$ZSH_VERSION" ]; then
		xxmakebash ${XXMAKERUNCMD}
	else
		eval ${XXMAKERUNCMD}
	fi
fi
}
xxmakesop2() {
XXMAKE_BUILD_PROJ="rcarh3n_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="rcarh3n_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="rcarh3n_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ}" $*
}
xxmakeaudi() {
XXMAKE_BUILD_PROJ="exynosauto_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=000GP --with-permission=no --enable-android-core --with-handcart=CP" $*
}
xxmakev920() {
XXMAKE_BUILD_PROJ="exynosauto_eng"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=EP33L --with-permission=no" $*
}
xxmakev920_multi() {
XXMAKE_BUILD_PROJ="exynosauto_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=EP33L --with-permission=no --enable-android-core" $*
}
xxmakesamsung() {
XXMAKE_BUILD_PROJ="exynosauto_eng"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=EP33L" $*
}
xxmakesamsung_multi() {
XXMAKE_BUILD_PROJ="exynosauto_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=EP33L --with-permission=no --enable-android-core" $*
}
xxmakemeb() {
XXMAKE_BUILD_PROJ="exynosauto_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=00MEB --with-handcart=CP,hicar --enable-android-core --enable-qnx-core" $*
}
xxmakeporsche() {
XXMAKE_BUILD_PROJ="exynosauto_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="exynosauto_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=EP33L --enable-android-core" $*
}
xxmakegp4() {
XXMAKE_BUILD_PROJ="sa8155_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="sa8155_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="sa8155_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=hmi --with-targettype=ivi --with-cartype=0S12L --with-permission=no" $*
}
xxmakegp4emu() {
XXMAKE_BUILD_PROJ="emulator_user"
xxmakerun "${XXMAKE_BUILD_PROJ} --with-arch-target=arm64 --with-arch-target-variant=arm64 --with-glibcversion=2.31 --with-toolchainversion=9.3 --with-toolchainname=aarch64-oe-linux --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=0S12L" $*
}
alias xxmakesop4="xxmakegp4"
xxmakes12() {
XXMAKE_BUILD_PROJ="sa8155_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="sa8155_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="sa8155_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --enable-android-core --with-cartype=0S12L" $*
}
xxmakelx() {
XXMAKE_BUILD_PROJ="sa8155_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="sa8155_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="sa8155_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --enable-android-core --with-cartype=EP33L" $*
}
xxmakevs7() {
XXMAKE_BUILD_PROJ="rcarm3_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="rcarm3_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="rcarm3_eng"
elif [[ "$1" == "prod" ]]; then
	XXMAKE_BUILD_PROJ="rcarm3_user --with-platform_mode=P --enable-prod_mode=yes --with-fourgmod_version="
fi
xxmakerun "${XXMAKE_BUILD_PROJ}" $*
}
xxmakevs8() {
XXMAKE_BUILD_PROJ="x9m_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="x9m_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="x9m_eng"
fi
XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-mapactivate=N"
xxmakerun "${XXMAKE_BUILD_PROJ}" $*
}
xxmakebsts() {
XXMAKE_BUILD_PROJ="c1200_user"
if [[ x"$1" == x"user" ]]; then
	XXMAKE_BUILD_PROJ="c1200_user"
elif [[ x"$1" == x"eng" ]]; then
	XXMAKE_BUILD_PROJ="c1200_eng"
fi
#XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=min_system"
XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=ivi_core"
#XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=ivi_core --enable-android-core"
xxmakerun "${XXMAKE_BUILD_PROJ}" $*
}
xxmakebst() {
XXMAKE_BUILD_PROJ="c1200_user"
if [[ x"$1" == x"user" ]]; then
	XXMAKE_BUILD_PROJ="c1200_user"
elif [[ x"$1" == x"eng" ]]; then
	XXMAKE_BUILD_PROJ="c1200_eng"
fi
#XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=min_system"
#XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=ivi_core"
XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=ivi_core --enable-android-core"
xxmakerun "${XXMAKE_BUILD_PROJ}" $*
}
xxmakej7() {
XXMAKE_BUILD_PROJ="j7_user"
if [[ x"$1" == x"user" ]]; then
	XXMAKE_BUILD_PROJ="j7_user"
elif [[ x"$1" == x"eng" ]]; then
	XXMAKE_BUILD_PROJ="j7_eng"
fi
#XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=min_system"
XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=ivi_core --enable-android-core"
xxmakerun "${XXMAKE_BUILD_PROJ}" $*
}
xxmakecmp() {
XXMAKE_BUILD_PROJ="x9sp_user"
if [[ x"$1" == x"user" ]]; then
	XXMAKE_BUILD_PROJ="x9sp_user"
elif [[ x"$1" == x"eng" ]]; then
	XXMAKE_BUILD_PROJ="x9sp_eng"
fi
#XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-targettype=ivi --with-cartype=CNS3P --with-permission=no --with-packagelevel=ivi_core"
XXMAKE_BUILD_PROJ="${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=CNS3P --enable-android-core --with-handcart=CP,carlink,hicar"
xxmakerun "${XXMAKE_BUILD_PROJ}" $*
}
xxmakels6() {
XXMAKE_BUILD_PROJ="oriny_user"
if [[ "$1" == "user" ]]; then
	XXMAKE_BUILD_PROJ="oriny_user"
elif [[ "$1" == "eng" ]]; then
	XXMAKE_BUILD_PROJ="oriny_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ai_core --with-targettype=ivi --with-cartype=S12M3" $*
}
xxmakefm1() {
XXMAKE_BUILD_PROJ="sa8797_user"
if [[ "$1" = "user" ]]; then
	XXMAKE_BUILD_PROJ="sa8797_user"
elif [[ "$1" = "eng" ]]; then
	XXMAKE_BUILD_PROJ="sa8797_eng"
fi
xxmakerun "${XXMAKE_BUILD_PROJ} --with-packagelevel=ivi_core --with-targettype=ivi --with-cartype=S31M1 --with-platform_mode=G --with-v8=false --enable-android-core --with-disable_map_img --with-android_image_url=@PRE_TASK_IMAGE_URL@ --with-cache_max_size=0" $*
}
alias xxmake='xxmakefm1'
alias xxpkg='pushd . && bbcg2 xmake && . xdirs && xmake image-stripped'
cdpl() {
. ~/code/shell/readCode.sh && bbcgrepo ./vendor/mediatek/proprietary/bootable/bootloader/preloader/ ;
if [[ "$?" == "1" ]]; then
	echo "no common preloader folder, try another"
	cd ./bootable/bootloader/preloader-mtk/
fi ; }
cdlk() {
. ~/code/shell/readCode.sh && bbcgrepo ./vendor/mediatek/proprietary/bootable/bootloader/lk/ ;
if [[ "$?" == "1" ]]; then
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
bbcmake2v23() {
	export PATH=/usr/local/cmake-3.23.0/bin:$PATH ;
}
bbtoolsvs7() {
	export TOOLS_VS7=/workspace/codebase/repos/toolchain/vs7/aarch64-poky-linux-7.3-glibc-2.27 ;
	export PATH=$TOOLS_VS7/bin:$PATH ;
}
bbtools() {
	export TOOLS_VS8=/workspace/.toolchain_install_dir/aarch64-poky-linux-7.3-glibc-2.27 ;
	export PATH=$TOOLS_VS8/bin:$PATH ;
}
bbcc() {
	#sudo update-alternatives --install /usr/local/bin/gcc gcc /usr/bin/gcc-5 50 ;
	#sudo update-alternatives --install /usr/local/bin/gcc gcc /usr/bin/gcc-4.9 49 ;
	#sudo update-alternatives --install /usr/local/bin/g++ g++ /usr/bin/g++-5 50 ;
	#sudo update-alternatives --install /usr/local/bin/g++ g++ /usr/bin/g++-4.9 49 ;
	#sudo update-alternatives --config gcc ;
	#sudo update-alternatives --config g++ ;
	if [[ "$1" == "49" ]]; then
		sudo update-alternatives --set gcc /usr/bin/gcc-4.9 ;
		sudo update-alternatives --set g++ /usr/bin/g++-4.9 ;
	elif [[ "$1" == "50" ]]; then
		sudo update-alternatives --set gcc /usr/bin/gcc-5 ;
		sudo update-alternatives --set g++ /usr/bin/g++-5 ;
	fi
}

alias abb='adb -host'
alias abbr='adb -host remount'
alias abben="adb -host remount && adb -host shell \"echo 'enable n;' > /proc/alog\""
alias abbd='adb -host devices'
alias abbs="adb -host wait-for-device && adb -host shell \"echo 'enable n;' > /proc/alog\" && adb -host remount && adb -host shell"
alias abbss='adb -host shell'
alias abbpush='adb -host push'
alias abbpull='adb -host pull'
abbc() {
if [[ "$2" == "" ]];then
  adb -host connect $1:8888 ;
else
  adb -host connect $1:$2 ;
fi
}
