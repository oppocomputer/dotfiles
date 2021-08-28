#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap be &
numlockx &
polybar hub &
brightnessctl -d amdgpu_bl0 s 60% &
picom -f &
#feh --bg-fill /home/yves/Pictures/Wallpapers/a11pan1040226lftsm.jpg  &
#feh --bg-fill /home/yves/Pictures/Wallpapers/719179.png &
feh --bg-scale Pictures/Wallpapers/anime-walking-japan.jpg &
exec bspwm 
