# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh
ZSH_DISABLE_COMPFIX=true

plugins=(
  git
  bgnotify
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker
  z
  web-search
  lein
)

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
alias dc="docker-compose"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/ncurses/bin:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# Set JAVA_HOME using asdf
. ~/.asdf/plugins/java/set-java-home.zsh

function nugo() {
    cd $(find ~/dev/nu/* -type d -maxdepth 0 | fzf)
}

function proj() {
    cd $(find ~/dev/* -type d -maxdepth 0 | fzf)
}

function dotfiles() {
  cd ~/my-dotfiles && nvim .
}

function restartgpg() {
  export GPG_TTY=$(tty)
  export PINENTRY_USER_DATA="USE_CURSES=1"

  echo "test" | gpg2 --clearsign
}

export GPG_TTY=$(tty)
export PINENTRY_USER_DATA="USE_CURSES=1"

source ~/.nurc
