ZSH_THEME="robbyrussell" # set by `omz`

export ZSH=~/.oh-my-zsh
ZSH_DISABLE_COMPFIX=true


source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gs="git status -u"
alias gc="git checkout"
alias ll="ls -lha"
alias gl="git log --oneline --decorate"
alias gd="git diff"
alias dc="docker-compose"
alias mux="tmuxinator"
alias clj-repl="lein with-profiles +repl repl :headless"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
source <(kubectl completion zsh)

export PATH="/usr/local/opt/ncurses/bin:$PATH"


function nugo() {
    cd $(find ~/dev/nu/* -type d -maxdepth 0 | fzf)
}

function nudev() {
    selected=$(find ~/dev/nu/* -maxdepth 0 -type d | fzf)
    selected_name=$(basename "$selected" | tr . _)

    tmuxinator start nudev -n $selected_name $selected
}

function proj() {
    cd $(find ~/dev/* -type d -maxdepth 0 | fzf)
}

function dotfiles() {
  cd ~/dev/leonam/my-dotfiles && nvim .
}

function restartgpg() {
  export GPG_TTY=$(tty)
  export PINENTRY_USER_DATA="USE_CURSES=1"

  echo "test" | gpg2 --clearsign
}

export GPG_TTY=$(tty)
export PINENTRY_USER_DATA="USE_CURSES=1"

source ~/.nurc

autoload -Uz compinit bashcompinit && compinit && bashcompinit
source "$NU_HOME/nucli/nu.bashcompletion"

export PATH="/usr/local/sbin:$PATH"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(
  git
  bgnotify
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  z
  web-search
  lein
)
