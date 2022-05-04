#!/bin/sh

# In host:
# scp -r ~/HomeSettings/ docker:~/workspace/home/
# scp -r ~/.vim docker:~/workspace/home/
# scp -r ~/.tmux docker:~/workspace/home/

ln -s ${HOME}/workspace/home/.vim ${HOME}/
ln -s ${HOME}/workspace/home/HomeSettings ${HOME}/
ln -s ${HOME}/workspace/home/HomeSettings/.ackrc ${HOME}/
ln -s ${HOME}/workspace/home/HomeSettings/.vimrc ${HOME}/
ln -s ${HOME}/workspace/home/HomeSettings/.bash_profile ${HOME}/
ln -s ${HOME}/workspace/home/HomeSettings/.tmux.conf.bash ${HOME}/.tmux.conf
ln -s ${HOME}/workspace/home/HomeSettings/machine-specific/.machine-specific-ali-docker.bash ${HOME}/.machine-specific.bash
ln -s ${HOME}/workspace/home/HomeSettings/machine-specific/.machine-specific-ali-docker.vim ${HOME}/.machine-specific.vim

mkdir ${HOME}/code
ln -s ${HOME}/workspace/home/HomeSettings/code/shell ${HOME}/code/shell

# sudo apt install ack-grep vim emacs tmux cscope ctags fzf autojump