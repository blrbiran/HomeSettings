#!/bin/zsh
# === Place machine specific zsh settings here.

# aliases and functions
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

alias bbconf='vi ~/.bash_profile ~/.zshrc ~/.vimrc'
alias bbdf='df -h | gc -vP "worktmp(?=/)"'
bbpush() { git push mediatek HEAD:refs/for/$1 ; }
bbup() { ls $* | xargs -I {} mtkbuild -o . -l -i -d -x {} ; }

alias yocas='export CAS_CONFIG=CONFIG_YOCTO_GCN_SPICE'
alias unyocas='unset CAS_CONFIG'
alias casrm='cas-remove'
bbrmyocbuild() { mkdir old && mv build/ sstate-cache/ old && \
	echo "start rm old folder" && rm -rf old ; }
bbcl() { cas-labels -b alps-mp-$1 ; }
bbct() { s1=( $(sed -r "s/(alps)-(mp|dev)-([0-9a-z.]*)-/\3-$2-/g" <<< "$1"));
cas-take $1 -n $s1 ;
}
bbct2() {
s0=( $(grep --color=auto -Po "(?<=alps-mp-)[a-zA-Z0-9.\-_]*" <<< "$1") ) ;
s1=( $(grep --color=auto -Eo "[a-zA-Z0-9.]*-" <<< "$s0" ) ) ;
s2=$s1$2-${s0:${#s1}:${#s0}} ; cas-take $1 -n $s2 ; }
bbct3() { cas-take alps-mp-$1 -n $2 ; }

# == PATH settings
export PATH=/mtkoss/git:$PATH
PATH=~/usr/bin:~/code/shell:/worktmp/home/usr/bin:$PATH
export PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/worktmp/home/usr/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/worktmp/home/usr/lib/pkgconfig

# == P4 settings
export P4PORT=10.17.1.181:2008
export P4USER=ran.bi
# source /mtktools/perforce/bash_p4

# Python settings
export PYTHONPATH=/worktmp/home/usr/lib/python2.7/site-packages
# export MANPATH="/usr/local/man:$MANPATH"

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
