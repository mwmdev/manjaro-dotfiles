#!/bin/bash

#{{{ General settings

# Confirm before overwriting
alias cp="cp -i"
alias mv="mv -i"
alias ln="ln -i"

# Human readable sizes
alias df='df -h'
alias free='free -m'

# Nicer ls
alias ls='ls --color=auto'
alias ll='ls -lhA'
alias lls='ls -lhAS'
alias llt='ls -lhAt'

# Path
alias mpat='echo -e ${PATH//:/\\n}'

# Package management
alias mins='sudo pacman -S'
alias mupd='sudo pacman -Syy'
alias mupg='sudo pacman -Syu'
alias mrmv='sudo pacman -Rns'

# Mount remote drives
alias mmnt='sudo mount -a'

# Reload config files
alias br='. ~/.bashrc'
alias xr='xrdb ~/.Xresources'
alias xm='xmodmap ~/.Xmodmap'

# Search in files recursively
alias sif='grep -rnwl . -e'

#}}}

#{{{ Folders shortcuts
alias ..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias usb='cd /var/run/user/1000/gvfs'
alias l='cd ~/Localserver'
alias c='cd ~/Documents/work/clients'
alias d='cd ~/Downloads'
# When in Localserver/project, jump to project plugins or theme folder
alias t='cd $(find . -type d -name "public" | head -n 1) && cd wp-content/themes'
alias p='cd $(find . -type d -name "public" | head -n 1) && cd wp-content/plugins'
#}}}

#{{{ Applications shortcuts

# File browser
alias f='vifm'

# Text editor
alias v='lvim'

# Python
alias python='python3'

# LM chat
alias n='cd ~/scripts/neuma && source env/bin/activate && python3 neuma.py'

# Webcam
alias mcam='mpv /dev/video0'

# Python
alias py='python3'
alias python='python3'

# gitLab cli
alias gl='glab'

# VPN
alias vpn='protonvpn-cli c'
alias vpnc='protonvpn-cli c "CH-ES#1"'
alias vpnd='protonvpn-cli d'
alias vpns='protonvpn-cli s'
alias vpnf='protonvpn-cli c --fastest --protocol udp'
alias vpnr='protonvpn-cli c --random --protocol udp'

# Git
alias ga='git add -A'
alias gc='git commit -m'
alias gs='git status'
alias gsm='git status -uno'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gpm='git push origin master'
alias gpb='git push origin bugfix'
alias gpd='git push origin dev'
alias gf='git fetch --all'
alias gpu='git pull'

# Git (dotfiles)
alias gda='git dotfiles add'
alias gdc='git dotfiles commit -m'
alias gdd='git dotfiles diff'
alias gds='git dotfiles status -uno'
alias gdp='git dotfiles push'

# Wordpress
alias wpgi='wget -O .gitignore "https://gitlab.com/snippets/1699715/raw"'
alias wpev='wp eval-file eval.php'

# Browserstack local testing
alias mbst='sudo ~/Apps/BrowserStackLocal --key vFgsz1AenexVBvdHBzpM'

# Tmuxinator
# alias mux='tmuxinator'

# Youtube search
alias myts='ytfzf -T mpv -t'

# Odyssey search
alias mods='ytfzf -T mpv -cO'

# Torrent search
alias mtrs='pirate-get -t'

# Network
alias mpig='ping -c 5 www.google.com'
alias mgip='curl ipinfo.io/'

# Weather
alias mwea='curl wttr.in/$WEATHER_TOWN'

# Matrix
alias mtrx='cmatrix'

#}}}

#{{{ Config files shortcuts
alias mbrc='$EDITOR ~/.bashrc'
alias mbal='$EDITOR ~/.bash_aliases'
alias mbpr='$EDITOR ~/.bash_profile'
alias mpro='$EDITOR ~/.profile'
alias mfst='sudo $EDITOR /etc/fstab'
alias mhst='sudo $EDITOR /etc/hosts'
alias mxrs='$EDITOR ~/.Xresources'
alias msrc='sudo $EDITOR /etc/apt/sources.list'
alias mvrc='$EDITOR ~/.vimrc'
alias mlvc='$EDITOR ~/.config/lvim/config.lua'
alias mi3c='$EDITOR ~/.i3/config'
alias mplb='$EDITOR ~/.config/polybar/config'
alias mgtk='$EDITOR ~/.config/gtk-3.0/settings.ini'
alias mvfr='$EDITOR ~/.config/vifm/vifmrc'
alias mnbt='$EDITOR ~/.config/newsboat/config'
alias mnbu='$EDITOR ~/.config/newsboat/urls'
alias msal='$EDITOR ~/.ssh_aliases'
#}}}

# Remote servers connexions
if [ -f ~/.ssh_aliases ]; then
	    . ~/.ssh_aliases
fi
