#!/data/data/com.termux/files/usr/bin/bash

unset LD_PRELOAD
proot --link2symlink -0 -r ~/tbots-distro \
-b /dev \
-b /proc \
-b /sys \
-w /root \
/usr/bin/env -i \
HOME=/root \
TERM=$TERM \
LANG=C.UTF-8 \
/bin/sh
