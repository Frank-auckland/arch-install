#!/usr/bin/env bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset +fp /usr/share/fonts/local
xset fp rehash                  # Something else for the fonts
#xset dpms force on
xset s 300 300
fc-cache
xset m 1/1 0                    # No Mouse Acceleration

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr &

#xmodmap ~/.xmodmap &

xrandr --output DP1 --left-of DP2 --output eDP1 --off &
#xrandr --output DP1 --left-of DP2 --output & 

nitrogen --restore &

fcitx &

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar example &
polybar main &

echo "Bars launched..."

exec 2bwm

# vim: ft=sh ts=4 sw=4 tw=0 fdm=marker foldlevel=0 :
