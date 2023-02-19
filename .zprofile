eval "$(/opt/homebrew/bin/brew shellenv)"

export D="$HOME/Documents"
export DL="$HOME/Downloads"
export DK="$HOME/Desktop"
export DT="$HOME/devt"
export DC="$D/doctorat"
export BK="$D/livres"
export BT="$D/livres/pdf/tech"

_P10PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin"
_PROJECT_FOLDER_PATH="$DT/phd/tool-folder"
_D4J_PATH="$_PROJECT_FOLDER_PATH/defects4j/current/framework/bin"

export GOPATH="$DT/go"
export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export PATH="$PATH:$_P10PATH:$_D4J_PATH:$D$GOPATH:$CPATH:$LIBRARY_PATH"

# Required by SimFix (https://github.com/xgdsmileboy/SimFix)
export DEFECTS4J_HOME="$_PROJECT_FOLDER_PATH/defects4j/current"


alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias his='history | grep $1'
alias du='du -sh'

alias p3='python3'
alias pi='python3 -m pip install'
alias pp='python3 -m pip'
alias pv='python3 -m venv'

alias mvncr='mvn clean package && java -jar target/*.jar'
alias mvnr='mvn package && java -jar target/*.jar'

alias mrpython='python3.10 $_PROJECT_FOLDER_PATH/mrpython/mrpython/Application.py &'
alias d4j='defects4j'
function d4jch() { d4j checkout -p $1 -v $2 -w $3 }

function cdir () { mkdir -p "$@" && eval cd "\"\$$#\""; }
