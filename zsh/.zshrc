############
# zsh
############

export ZSH="/home/andrey/.oh-my-zsh"

ZSH_THEME="terminalparty"
CASE_SENSITIVE="false"
plugins=(git taskwarrior)

source $ZSH/oh-my-zsh.sh

############
# dircolors
############

[ -f "$HOME/.dircolors" ] && eval "$(dircolors ~/.dircolors)"

############
# ~/.zsh.d
############

if [ -d ~/.zsh.d ]; then
    for i in ~/.zsh.d/*; do
        [ -f "${i}" ] && source "${i}"
    done
fi

############
# base16
############

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_classic-dark

# ###########
# taskwarrior
# ###########

alias t=task
_task() {
  _arguments "1: :($(task _commands))"
}
compdef _task t, task
