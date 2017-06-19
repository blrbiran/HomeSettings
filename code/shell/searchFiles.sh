#!/bin/sh
function do_proc() {
  data=`cat $1 -n | grep $2 --color=always`
  if [ "${data}" != "" ];then
    echo -e "\033[33m$1\033[0m"
    echo "${data}"
  fi
}

function scandir() {
  local cur_dir parent_dir workdir
  workdir=$1
  cd ${workdir}
  if [ ${workdir} = "/" ];then
    cur_dir=""
  else
    cur_dir=$(pwd)
  fi
  
  for dirlist in $(ls ${cur_dir})
  do
    if [ -d ${dirlist} ];then
      cd ${dirlist}
      if [ $# -lt 3 ];then
        scandir ${cur_dir}/${dirlist} $2
      else
        scandir ${cur_dir}/${dirlist} $2 $3
      fi
      cd ..
    else
      if [ $# -lt 3 ];then
        do_proc ${cur_dir}/${dirlist} $2
      else
      # file's suffix == $3
        do_proc ${cur_dir}/${dirlist} $2
      fi
    fi
  done
}

if [ -d $1 ];then
  if [ $# -lt 3 ];then
    scandir $1 $2
  else
    scandir $1 $2 $3
  fi
elif [ -f $1 ];then
  echo "you input a file but not a dir, pls retry."
  exit 1
else
  echo "the Dir isn't exist, pls retry."
  exit 1
fi
