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

function colorscheme() {
  for i in {1..3}; do
    for j in {40..47}; do
      echo -ne "\e[;$j""m   "
    done
    echo
  done
}

[ -f "$HOME/.dircolors" ] && eval "$(dircolors ~/.dircolors)"

############
# ~/.bash.d
############

#BASE16_SHELL_SET_BACKGROUND=false

if [ -d ~/.bash.d ]; then
    for i in ~/.bash.d/*; do
        [ -f "${i}" ] && source "${i}"
    done
fi

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
