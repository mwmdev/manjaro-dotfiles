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
alias mins='sudo apt-get install'
alias mupd='sudo apt-get update'
alias mrmv='sudo apt-get remove'

# Mount remote drives
alias mmnt='sudo mount -a'

# Reload config files
alias br='. ~/.bashrc && regolith-look refresh'
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
alias t='cd $(find . -type d -name "public" | head -n 1) && cd wp-content/themes'
alias p='cd $(find . -type d -name "public" | head -n 1) && cd wp-content/plugins'
#}}}

#{{{ Applications shortcuts

# File browser
alias f='vifm'

# Text editor
alias v='nvim'

# Webcam
alias mcam='mpv /dev/video0'

# Python
alias py='python3'

# Todo list
alias mtod='rg @@TODO ~/Localserver'

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
alias gad='git dotfiles add'
alias gcd='git dotfiles commit -m'
alias gsd='git dotfiles status -uno'
alias gpd='git dotfiles push'

# Wordpress
alias wupd='curl https://gitlab.com/snippets/1880897/raw > update.sh'
alias wstu='curl https://gitlab.com/snippets/2076050/raw > .startup'
alias wpgi='wget -O .gitignore "https://gitlab.com/snippets/1699715/raw"'
alias wptm='wget -O .tmuxinator "https://gitlab.com/snippets/2495361/raw"'
alias wpev='wp eval-file eval.php'

# Browserstack local testing
alias mbst='sudo ~/Apps/BrowserStackLocal --key vFgsz1AenexVBvdHBzpM'

# Tmuxinator
alias mux='tmuxinator'

# Youtube search
alias myts='ytfzf -T mpv -t'

# Odyssey search
alias mods='ytfzf -T mpv -cO'

# Torrent search
alias mtrs='pirate-get -t'

# Network
alias mpig='ping -c 5 www.google.com'
alias mgip='curl ipinfo.io/'

# Backup
alias mbkp='cd /media/mike/Mnemosyne && sudo dd if=/dev/nvme0n1 of=./temple.image status=progress'

# Weather
alias mwea='curl wttr.in/argentona'

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
alias mi3x='$EDITOR ~/.config/regolith2/Xresources'
alias mi3p='$EDITOR ~/.config/regolith2/picom/config'
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
