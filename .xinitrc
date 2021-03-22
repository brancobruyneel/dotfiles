xrdb ~/.Xresources
xmodmap ~/.Xmodmap
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
dwm 2> ~/.dwm.log
