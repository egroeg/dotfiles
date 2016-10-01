#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset +fp /usr/share/fonts/local, $HOME/.fonts
xset fp rehash
xmodmap -e "keycode 191 = Insert"  
setterm -blank 0 -powersave off -powerdown 0
xset s off
xset -dpms s noblank
# xsetroot -cursor_name X_cursor
# Xcursor.size: 32

# (sleep 10; conky -q) &
# tint2 -c ~/.tint2rc &

if [[ -z `xrandr | grep " connected" | grep 'VGA'` ]]; then
echo "External monitor not found"
else
xrandr --output LVDS1 --mode "1280x800"
xrandr --output VGA1 --mode "1920x1080" --right-of LVDS1
fi

# xbindkeys &
volnoti &
xscreensaver -no-splash &
feh --bg-scale ~/img/cooler.png &

case $1 in
xfce)
exec ck-launch-session startxfce4
;;

i3)
feh --bg-scale ~/img/cooler.png &
exec i3
;;

bspwm)
eval $(cat ~/.fehbg)
sxhkd -c .sxhkdrc &
[ -e /tmp/panel-fifo ] && rm /tmp/panel-fifo
mkfifo /tmp/panel-fifo
exec bspwm -s /tmp/panel-fifo -p W
;;

herb|*)
eval $(cat ~/.fehbg)
exec herbstluftwm --locked 
;;
esac
