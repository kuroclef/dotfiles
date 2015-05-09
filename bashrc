[[ $- != *i* ]] && return

. ~/repositories/dotfiles/rc
. ~/repositories/dotfiles/git/git-completion.bash
PS1=$'\n\u@\h \w $(__git_ps1 "[%s]")\n\\$ '
HISTCONTROL=erasedups

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
#bind '"^[[A": history-search-backward'
#bind '"^[[B": history-search-forward'
bind 'TAB: menu-complete'
bind 'set colored-stats on'
bind 'set menu-complete-display-prefix on'
bind 'set show-all-if-ambiguous on'

_cd() {
  \cd "$@"; ls; [[ -a .git/config ]] && echo && git log && echo && git remote get-url origin
}

alias cd=_cd
