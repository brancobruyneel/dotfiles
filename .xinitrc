xrdb ~/.Xresources
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK 
ssh-add &
dwm 2> ~/.dwm.log
