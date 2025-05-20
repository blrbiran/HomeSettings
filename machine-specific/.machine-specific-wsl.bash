#!/bin/bash
# === Place machine specific bash settings here.
alias ll='ls -alFh'
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


#alias bbdf='df -h | gc -vP "worktmp(?=/)"'
alias bbdf='df -h'
bbln() {
	BB_FOLDER_NAME=$(echo $1 | cut -d "/" -f1)
	echo "ln -s ${PWD}/${BB_FOLDER_NAME} ${BB_FOLDER_NAME}_$2"
	ln -s ${PWD}/${BB_FOLDER_NAME} ${BB_FOLDER_NAME}_$2
}

# == PS1 settings
#PS1="[\u@\h \W]\$"
prompt_git=y
function last-command-prompt {
	if [ $? == 0 ];then
		printf "\[\e[0;32m\]➔ "
	else
		printf "\[\e[0;31m\]✘ "
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
		echo "\[\e[0;34m\](\[\e[0;33m\] \[\e[0;31m\]${branch}\[\e[0;34m\])${state}"
	fi
}
function set-bash-prompt {
	PS1="$(last-command-prompt)\[\e[0;36m\]\W$(git-branch-prompt)\[\e[0m\] "
}
PROMPT_COMMAND=set-bash-prompt

# == aliases and functions

# == PATH settings

# == Python path

