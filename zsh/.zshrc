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
# pywal
############

(cat ~/.cache/wal/sequences &)

# ###########
# taskwarrior
# ###########

alias t=task
_task() {
  _arguments "1: :($(task _commands))"
}
compdef _task t, task
