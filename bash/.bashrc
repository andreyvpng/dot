# .bashrc


############
# default
############

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi


############
# general
############

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

bind '"\C-h": backward-word'
bind '"\C-d\C-h": backward-kill-word'
bind '"\C-l": forward-word'
bind '"\C-d\C-l": kill-word'

# Update window size after every command
shopt -s checkwinsize

[ -f "$HOME/.dircolors" ] && eval "$(dircolors ~/.dircolors)"

############
# ~/.bash.d
############

if [ -d ~/.bash.d ]; then
    for i in ~/.bash.d/*; do
        [ -f "${i}" ] && source "${i}"
    done
fi
