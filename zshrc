. ~/repositories/dotfiles/rc
. ~/repositories/dotfiles/git/git-prompt.sh
. /usr/share/doc/pkgfile/command-not-found.zsh
PS1=$'\n%F{4}%n%f@%M %~ $(__git_ps1 "[%s]")\n%(!.#.>) '
HISTFILE=~/repositories/dotfiles/zsh_history
HISTSIZE=1000
SAVEHIST=1000

autoload -U compinit; compinit -D
autoload -U history-search-end

setopt histignorealldups
setopt histreduceblanks
setopt listpacked
unsetopt listtypes
unsetopt nomatch
setopt promptsubst
setterm -blength 0 2>/dev/null

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end  history-search-end

zstyle ':completion:*' list-colors  "${(s/:/)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:vim*:*' ignored-patterns '*.od*' '*.pdf'

chpwd() { ls; [[ -a .git/config ]] && echo && git log && echo && git remote get-url origin }
precmd() bindkeys

bindkeys() {
  bindkey -e
  bindkey "${terminfo[khome]}" beginning-of-line
  bindkey "${terminfo[kend]}"  end-of-line
  bindkey "${terminfo[kdch1]}" delete-char
# bindkey "${terminfo[kcuu1]}" history-beginning-search-backward-end
# bindkey "${terminfo[kcud1]}" history-beginning-search-forward-end
  bindkey "${terminfo[kcbt]}"  reverse-menu-complete
  bindkey "[A" history-beginning-search-backward-end
  bindkey "[B" history-beginning-search-forward-end
}
