eval "$(dircolors -b)"
export EDITOR=vim
export FILTER_BRANCH_SQUELCH_WARNING=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export LANG=C.UTF-8
export LESS=-FMRXx2
export LESSHISTFILE=-
export LIBSEAT_BACKEND=logind
export MANPAGER='vim +MANPAGER --not-a-term -'
export PAGER=less
export PKGEXT=.pkg.tar
#export PROTON_MEDIA_USE_GST=1
#export PROTON_USE_NTSYNC=1
export READNULLCMD=$PAGER
export WEBKIT_DISABLE_DMABUF_RENDERER=1
#export WORDCHARS='*?_-[]~&;!#$%^(){}<>'
export XMODIFIERS=@im=fcitx

case "$(basename "$(readlink /proc/"$$"/exe)")" in
  bash )
    [ $- = *i* ] && . ~/.bashrc
    ;;

  zsh )
    [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && exec sway --unsupported-gpu > ~/.config/sway.log 2>&1
    ;;
esac
