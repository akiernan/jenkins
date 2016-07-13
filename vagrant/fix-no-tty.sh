# -*- mode: shell-script; -*-

set -e

sudo sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' /root/.profile
