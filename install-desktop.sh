#!/bin/bash

# colors
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"

installXfce() {
    echo ${G}"Installing XFCE Desktop..."${W}
    apt-get update
    apt-get install udisks2 -y
    rm -rf /var/lib/dpkg/info/udisks2.postinst
    echo "" >>/var/lib/dpkg/info/udisks2.postinst
    dpkg --configure -a
    apt-mark hold udisks2
    apt-get install xfce4 xfce4-goodies dbus-x11 tigervnc-standalone-server -y
    echo "vncserver -geometry 1280x720 -xstartup /usr/bin/startxfce4" >>/usr/local/bin/vncstart
    echo "vncserver -kill :* ; rm -rf /tmp/.X1-lock ; rm -rf /tmp/.X11-unix/X1" >>/usr/local/bin/vncstop
    chmod +x /usr/local/bin/vncstart
    chmod +x /usr/local/bin/vncstop
    sleep 2
    exit
    echo
}

help() {
    echo "install-desktop xfce"
}

case $1 in
"xfce")
    installXfce
    ;;
*)
    help
    ;;
esac
