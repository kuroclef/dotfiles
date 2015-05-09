#!/bin/zsh

. ~/repositories/dotfiles/profile
[[ "$TTY" = /dev/tty1 ]] && exec sway > ~/.config/sway.log 2>&1
