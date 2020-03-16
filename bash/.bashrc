# .bashrc

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

[ -d "$HOME/jdk" ] && \
  PATH="$PATH:$HOME/jdk/bin"

[ -d "$HOME/go" ] && \
  export GOPATH=$HOME/go

PATH="$PATH:$GOPATH/bin"

export PATH

export EDITOR='nvim'

if [ -d ~/.bash.d ]; then
    for i in ~/.bash.d/*; do
        [ -f "${i}" ] && source "${i}"
    done
fi

[ -f "$HOME/.dircolors" ] && \
  eval "$(dircolors ~/.dircolors)"
