export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/andrey/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
#ZSH_THEME="avit"
ZSH_THEME="kphoen"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
plugins=(git taskwarrior)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8

export EDITOR='nvim'

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias i3config="nvim ~/.config/i3/config"
alias nvimconfig="nvim ~/.config/nvim/init.vim"

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(dircolors ~/.dircolors)"
