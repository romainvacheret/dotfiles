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
    docker
)

bindkey '^[L' clear-screen

source $ZSH/oh-my-zsh.sh


# --- miscellaneous --- 

[[ ! -r /Users/romain/.opam/opam-init/init.zsh ]] || \
    source /Users/romain/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export HOMEBREW_NO_AUTO_UPDATE=1

# Must be after sourcing Oh My ZSH to override the existing alias
alias ls='exa --group-directories-first'

# --- Perl ---
PATH="/Users/romain/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/romain/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/romain/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/romain/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/romain/perl5"; export PERL_MM_OPT;

# --- Sdkman ---

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
