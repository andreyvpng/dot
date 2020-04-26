xrdb -I$HOME ~/.Xresources
xrdb -merge -I$HOME ~/.config/just-colors/cache/colors.Xresources
source ~/.profile
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
exec i3
