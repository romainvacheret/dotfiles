#TODO: why are there some quotes for which the delimiter in printed?
display_quote () {
    filename="$HOME/.quotes.txt"
    line_count=$(wc -l < $filename| tr -d ' ')
    rdn_line=$(($RANDOM % ($line_count + 1)))
    str=$(sed -n "$rdn_line p" $filename)
    idx=$(echo $str | grep -b -o \| | cut -d: -f1)

    printf "${str:0:$idx}\n"
    printf "%${COLUMNS}s" "${str:(($idx + 1))}"
}

display_quote

# --- Oh-my-zsh ---

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    sdk
)

source $ZSH/oh-my-zsh.sh

# --- Sdkman ---

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
