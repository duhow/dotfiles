# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/Applications:$HOME/.local/bin:$HOME/go/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH

# Add Homebrew if installed
if [ -e "/home/linuxbrew/.linuxbrew/" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(rtx git fzf common-aliases docker docker-compose httpie nmap pass rsync salt sudo tmux transfer wd web-search kubectl helm)

# stop adding escape characters
DISABLE_MAGIC_FUNCTIONS=true
source $ZSH/oh-my-zsh.sh

[ -e "$HOME/.bash_secrets" ] && source ${HOME}/.bash_secrets
#[ -e "$HOME/.local/share/rtx/shims" ] && PATH=$HOME/.local/share/rtx/shims:$PATH
