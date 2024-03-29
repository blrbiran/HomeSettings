# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

if [[ "$(uname)" = "Darwin" ]]; then # MacOS
# Set powerline Theme
#  POWERLINE_RIGHT_B="time replacement"
#  POWERLINE_RIGHT_A="exit-status"
#  POWERLINE_RIGHT_A="date"
#  POWERLINE_RIGHT_A="exit-status-on-fail"
#  POWERLINE_RIGHT_A="mixed"
#  POWERLINE_RIGHT_A_COLOR_FRONT="black"
#  POWERLINE_RIGHT_A_COLOR_BACK="red"
#  POWERLINE_DISABLE_RPROMPT="false"
#  POWERLINE_SHORT_HOST_NAME="true"
#  POWERLINE_SHOW_GIT_ON_RIGHT="false"
#  POWERLINE_HIDE_VIRTUAL_ENV="true"
#  POWERLINE_CUSTOM_CURRENT_PATH="%3~"
  if false;then
    POWERLINE_HIDE_USER_NAME="true"
    POWERLINE_HIDE_HOST_NAME="true"
    POWERLINE_PATH="short"
    POWERLINE_DETECT_SSH="true"

    ZSH_THEME="powerline"
  else
    export DEFAULT_USER="biran"
    ZSH_THEME="agnoster"
  fi
else # Linux
  if false;then
    POWERLINE_HIDE_USER_NAME="true"
    POWERLINE_HIDE_HOST_NAME="true"
    POWERLINE_PATH="short"
    POWERLINE_DETECT_SSH="true"

    ZSH_THEME="powerline"
  else
    ZSH_THEME="robbyrussell"
  fi
fi


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(common-aliases)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
#alias tmux="tmux -2"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
setopt hist_ignore_space
alias cd=' cd'
alias ls=' ls'

if [[ "$(uname)" = "Darwin" ]]; then # MacOS
  alias ll='ls -alh -G'
else # Linux
  alias ll='ls -alh --color'
fi
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias cd4='cd....'
alias cd5='cd.... ; cd.'
alias cd6='cd.... ; cd..'
alias cd7='cd.... ; cd...'
alias cd8='cd.... ; cd....'

unalias grep
alias gc='grep -i --color=auto'
alias gcr='grep -rni --color=auto'
alias gcrng='grep -rni --color=auto --exclude-dir={.git}'
alias gcre='grep -rni --color=auto -E'
alias gcrp='grep -rni --color=auto -P'

alias ta='tmux -f ~/.tmux.conf attach -t'
alias tab='tmux -f ~/.tmux.conf.bash attach -t'
alias tl='tmux -L zsh list-sessions | sed "s/^/[zsh] /g"; tmux -L bash list-sessions | sed "s/^/[bash] /g"'
alias ts='tmux -f ~/.tmux.conf -L zsh new-session -s'
alias tsb='tmux -f ~/.tmux.conf.bash -L bash new-session -s'

alias gg='git'
alias ggbi='git remote -v && git branch -a | head -n 10'
alias ggs='git status'
alias ggb='git branch -a'
alias ggc='git commit'
alias ggca='git commit --amend'
alias ggco='git checkout'
alias ggdf='git diff'
alias ggdfc='git diff --cached'
alias ggll='git ll'
alias ggl='git ls'
alias ggstash='git stash'

alias fdn='find . -iname'
alias frn='find / -iname'
alias fdd='find . -type d -iname'
alias fdf='find . -type f -iname'
alias lc='ll | grep --color=auto'
alias lsc='ls | grep '
alias rezsh='source ~/.zshrc'
alias h='history'
alias duc='du -h --max-depth=1'
alias vs='emacs'
alias vc='emacsclient'

# zsh vi mode
# Emacs mode
# bindkey -e
# Vim mode
bindkey -v

# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward


# VI MODE KEYBINDINGS (ins mode)
bindkey -M viins '^h'    vi-cmd-mode
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
bindkey -M viins '^k'    kill-line
bindkey -M viins '^r'    history-incremental-pattern-search-backward
bindkey -M viins '^s'    history-incremental-pattern-search-forward
bindkey -M viins '^p'    up-line-or-history
bindkey -M viins '^n'    down-line-or-history
bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins '^u'    backward-kill-line
#bindkey -M viins '^h'    backward-delete-char
bindkey -M viins '^?'    backward-delete-char
bindkey -M viins '^_'    undo
bindkey -M viins '^x^r'  redisplay
bindkey -M viins '\eOH'  beginning-of-line # Home
bindkey -M viins '\eOF'  end-of-line       # End
bindkey -M viins '\e[2~' overwrite-mode    # Insert
bindkey -M viins '\ef'   forward-word      # Alt-f
bindkey -M viins '\eb'   backward-word     # Alt-b
bindkey -M viins '\ed'   kill-word         # Alt-d


# VI MODE KEYBINDINGS (cmd mode)
bindkey -M vicmd '^a'    beginning-of-line
bindkey -M vicmd '^e'    end-of-line
bindkey -M vicmd '^k'    kill-line
bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
bindkey -M vicmd '^p'    up-line-or-history
bindkey -M vicmd '^n'    down-line-or-history
bindkey -M vicmd '^y'    yank
bindkey -M vicmd '^w'    backward-kill-word
bindkey -M vicmd '^u'    backward-kill-line
bindkey -M vicmd '/'     vi-history-search-forward
bindkey -M vicmd '?'     vi-history-search-backward
bindkey -M vicmd '^_'    undo
bindkey -M vicmd '\ef'   forward-word                      # Alt-f
bindkey -M vicmd '\eb'   backward-word                     # Alt-b
bindkey -M vicmd '\ed'   kill-word                         # Alt-d
bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
bindkey -M vicmd '\e[6~' history-beginning-search-forward  # PageDown



function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1

function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
    export PS1="$(powerline-shell $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
fi

export NODE_PATH=/usr/local/lib/node_modules

export GOROOT=$HOME/usr
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOBIN

# set jdk env
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=$PATH:${JAVA_HOME}/bin

export HADOOP_HOME=/usr/local/hadoop-2.7.3
export HADOOP_HOME_WARN_SUPPRESS=1
export PATH=$PATH:$HADOOP_HOME/bin

export SCALA_HOME=/usr/local/share/scala
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$SCALA_HOME/bin:$SPARK_HOME/bin

export PATH=$PATH:~/usr/bin

alias hstart="$HADOOP_HOME/sbin/start-dfs.sh;$HADOOP_HOME/sbin/start-yarn.sh"
alias hstop="$HADOOP_HOME/sbin/stop-dfs.sh;$HADOOP_HOME/sbin/stop-yarn.sh"
alias sstart="$SPARK_HOME/sbin/start-all.sh"
alias sstop="$SPARK_HOME/sbin/stop-all.sh"

export LANG=en_US.UTF-8

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

