# Use powerline
# USE_POWERLINE="true"

# Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

# Load bash aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Load profile 
if [ -f ~/.profile ]; then
    . ~/.profile
fi

# Private (API Keys, etc.)
if [ -f ~/.private ]; then
    . ~/.private
fi

# Generate i3 config file
cat ~/.config/i3/config.base ~/.config/i3/config.local > ~/.config/i3/config

# Oh my posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/gruvbox.omp.json)"

# Functions

# CD into a folder
fcd() {
    cd "$(find ~ -maxdepth 8 -not -path '*/\.git/*' -type d | fzf --height 40% --reverse --prompt='Choose folder: ' --pointer='➡')"
}
