#!/bin/zsh

. ~/repositories/dotfiles/profile
[[ "$TTY" = /dev/tty1 ]] && exec sway --unsupported-gpu > ~/.config/sway.log 2>&1
