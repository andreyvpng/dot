#!/bin/sh
i3 restart

ln -sf    "${HOME}/.cache/wal/dunstrc"    "${HOME}/.config/dunst/dunstrc"

pkill dunst
dunst &

if pgrep "qutebrowser" >/dev/null 2>&1 ; then
  qutebrowser :config-source
fi
