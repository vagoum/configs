ZSH=$HOME/.oh-my-zsh
EDITOR=nvim
ZSH_THEME="agnoster"

plugins=(
  git 
)

# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export PATH=/usr/local/bin:$HOME/bin:$PATH
export ICLOUD=~/Library/Mobile\ Documents/com~apple~CloudDocs/
source $ZSH/oh-my-zsh.sh
source $HOME/.nix-profile/etc/profile.d/nix.sh
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# opam configuration
test -r /Users/vagoum/.opam/opam-init/init.zsh && . /Users/vagoum/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
