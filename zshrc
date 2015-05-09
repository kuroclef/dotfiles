. /usr/share/doc/pkgfile/command-not-found.zsh
. ~/repositories/dotfiles/git/git-prompt.sh
PS1=$'\n%F{4}%n%f@%M %~ $(__git_ps1 "[%s]")\n%(!.#.>) '

alias cp='cp -rf'
alias ftp='ftp -p'
alias grep='grep --color=auto'
alias ln='ln -srnf'
alias logout='swaymsg exit'
alias ls='ls -A --color=auto --group-directories-first'
alias lscheckout='pacman -Qkk | grep \)$ |& sort'
alias lsdisowned='comm -23 <(find /{etc,usr,var} \( -path /etc/\*cert\* -o -path /usr/share/mime -o -path /var/\*/\*man \) -prune -o -type d -printf %p/\\n -o -print 2>/dev/null | sort) <(pacman -Qlq | sort -u)'
alias lsorphaned='comm -23 <(pacman -Qdq) <(pacman -Qeq | xargs -l pactree -lu | sort)'
alias lspackages='comm -23 <(pacman -Qeq) <(pacman -Qgq base-devel | sort -u)'
alias mkdir='mkdir -p'
alias output-analog='pacmd set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo'
alias output-hdmi='pacmd set-default-sink alsa_output.hw_0_7'
alias pacman='pacman --color=auto'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias rm='rm -rf'
alias sl=systemctl
alias sudo='sudo '
alias wallpaper='feh --bg-tile --no-fehbg'
alias -s exe='LANG=ja_JP.UTF-8 wine'

autoload -U compinit; compinit -D
autoload -U history-search-end

setopt globdots
setopt histignorealldups
setopt histreduceblanks
setopt listpacked
setopt nolisttypes
setopt promptsubst
setterm -blength 0 2>/dev/null

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end  history-search-end

zstyle ':completion:*' list-colors  "${(s/:/)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:vim*:*' ignored-patterns '*.od*' '*.pdf'

chpwd() ls -A --color=auto --group-directories-first
precmd() bindkeys
zshexit() dispose

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

dispose()
  rm -rf ~/.config/{QtProject.conf,cef_user_data,fontforge,gconf,gtk-2.0,menus,mypaint} \
         ~/.local/share/{applications,desktop-directories,icons,mime,recently-used.xbel} \
         ~/.{cache,esd_auth,gnome,log,pki,pulse-cookie,texlive,thumbnails}

fetchallgit()
  find ~/repositories/*/.git -maxdepth 0 -execdir \
    sh -c 'git fetch origin "$(git symbolic-ref --short HEAD)"' \;

gcallgit()
  find ~/repositories/*/.git -maxdepth 0 -execdir \
    sh -c 'git reflog expire --expire=now --all && git gc --prune=now --aggressive' \;

gdrive_dl() {
  local file_id=$1
  local file_name=$2
  curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${file_id}" >/dev/null
  local code="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
  curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${code}&id=${file_id}" -o "$file_name"
}

letsencrypt() {
  local domain_name=$1
  sudo certbot certonly \
    --agree-tos \
    --manual \
    --manual-auth-hook ~kuroclef/repositories/letsencrypt-dns-conoha/create_conoha_dns_record.sh \
    --manual-cleanup-hook ~kuroclef/repositories/letsencrypt-dns-conoha/delete_conoha_dns_record.sh \
    --manual-public-ip-logging-ok \
    --preferred-challenges dns-01 \
    --server https://acme-v02.api.letsencrypt.org/directory \
    -d "$domain_name" -d \*."$domain_name" \
    -m kuroclef@gmail.com
}

lsgit()
  find ~/repositories/*/.git -maxdepth 0 -execdir \
    sh -c '. ~/repositories/dotfiles/git/git-prompt.sh; __git_ps1 "%s \t"; basename "$PWD"' \;

resetallgit()
  find ~/repositories/*/.git -maxdepth 0 -execdir \
    sh -c 'git reset --hard origin/"$(git symbolic-ref --short HEAD)"' \;
