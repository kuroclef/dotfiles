#!/bin/zsh

eval "$(dircolors -b)"
export EDITOR=vim
export FILTER_BRANCH_SQUELCH_WARNING=true
#export GDK_BACKEND=wayland
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GTK_IM_MODULE=ibus
export LESS=-FMRXx2
export LESSHISTFILE=-
export LIBSEAT_BACKEND=logind
export MANPAGER='sh -c "col -b | vim -Rc set\ ft=man -"'
export MOZ_ENABLE_WAYLAND=true
export PAGER=less
export PATH="$(find {/usr,~/.local}/bin -maxdepth 1 -type d -printf %p:)"~/.cargo/bin:~/.gem/ruby/2.7.0/bin:~/.npm/bin
export PKGEXT=.pkg.tar
export QT_IM_MODULE=ibus
export READNULLCMD=$PAGER
export SOURCE_DATE_EPOCH=0
export WORDCHARS='*?_-[]~&;!#$%^(){}<>'
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_CURRENT_DESKTOP=sway
export XDG_DATA_HOME=~/.local/share
export XDG_RUNTIME_DIR=/run/user/"$(id -u)"
export XDG_SESSION_TYPE=wayland
export XMODIFIERS=@im=none

[[ "$TTY" = /dev/tty1 ]] && exec sway > ~/.config/sway.log 2>&1
