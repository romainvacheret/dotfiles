eval "$(/opt/homebrew/bin/brew shellenv)"

export D="$HOME/Documents"
export DL="$HOME/Downloads"
export DK="$HOME/Desktop"
export DT="$HOME/devt"

export GOPATH="$DT/go"
export CARGOPATH="$HOME/.cargo/bin"
export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export PATH="$PATH:$GOPATH:$GOPATH/bin:$CARGOPATH:$CPATH:$LIBRARY_PATH"


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
alias pd='python3 -m pydoc'
alias pm='python3 .'

alias mvncr='mvn clean package && java -jar target/*.jar'
alias mvnr='mvn package && java -jar target/*.jar'

function svba() {
    if [ -z "$1" ]; then
        if [ -d "venv" ]; then
            source venv/bin/activate
        elif [ -d ".venv" ]; then
            source .venv/bin/activate
        else
            echo "No venv or .venv found"
            return 1
        fi
    else
        source "$1/bin/activate"
    fi
}

function cdir () { mkdir -p "$@" && eval cd "\"\$$#\""; }
