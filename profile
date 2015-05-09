#!/bin/sh

eval "$(dircolors -b)"
export EDITOR=vim
export FILTER_BRANCH_SQUELCH_WARNING=true
#export GDK_BACKEND=wayland
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
#export GTK_IM_MODULE=
export LANG=C.UTF-8
export LESS=-FMRXx2
export LESSHISTFILE=-
export LIBSEAT_BACKEND=logind
export MANPAGER='sh -c "col -b | vim -Rc set\ ft=man -"'
export MOZ_ENABLE_WAYLAND=1
export PAGER=less
export PKGEXT=.pkg.tar
#export QT_IM_MODULE=
export READNULLCMD=$PAGER
export SOURCE_DATE_EPOCH=0
export WEBKIT_DISABLE_DMABUF_RENDERER=1
export WINIT_X11_SCALE_FACTOR=1
export WORDCHARS='*?_-[]~&;!#$%^(){}<>'
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_CURRENT_DESKTOP=sway
export XDG_DATA_HOME=~/.local/share
export XDG_RUNTIME_DIR=/run/user/"$(id -u)"
export XDG_SESSION_TYPE=wayland
export XMODIFIERS=@im=fcitx

case "$(basename "$(readlink /proc/"$$"/exe)")" in
  bash )
    [ $- = *i* ] && . ~/.bashrc
    ;;

  zsh )
    [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && exec sway --unsupported-gpu > ~/.config/sway.log 2>&1
    ;;
esac
