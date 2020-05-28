#!/bin/zsh

# Machine related aliases
alias vi='nvim'

# nvim related
export XDG_CONFIG_HOME=~/.config/
export XDG_DATA_HOME=~/.config/

# Golang related
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN

# Python
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
# Python has been installed as
#   /usr/local/opt/python@3.8/bin/python3
#
# You can install Python packages with
#   /usr/local/opt/python@3.8/bin/pip3 install <package>
# They will install into the site-package directory
#   /usr/local/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages
#
# See: https://docs.brew.sh/Homebrew-and-Python
#
# python@3.8 is keg-only, which means it was not symlinked into /usr/local,
# because this is an alternate version of another formula.
#
# If you need to have python@3.8 first in your PATH run:
#   echo 'export PATH="/usr/local/opt/python@3.8/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find python@3.8 you may need to set:
#   export LDFLAGS="-L/usr/local/opt/python@3.8/lib"

# sqlite & openssl
export PATH=/usr/local/opt/sqlite/bin:$PATH
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH

# Java related
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home
export MAVEN_HOME=$HOME/apache-maven-3.6.3
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin

# Tomcat related
export CATALINA_HOME=$HOME/tomcat
export CATALINA_BASE=$CATALINA_HOME
export PATH=$PATH:$CATALINA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib:$CATALINA_HOME/lib

# flutter related
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
#export FLUTTER_STORAGE_BASE_URL=https://mirrors.sjtug.sjtu.edu.cn
#export PUB_HOSTED_URL=https://dart-pub.mirrors.sjtug.sjtu.edu.cn
export PATH=$PATH:$HOME/flutter/bin

# For MacOS in Black Apple

# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/biran/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/biran/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/biran/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/biran/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# conda ran settings
conda deactivate

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

