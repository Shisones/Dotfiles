HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle :compinstall filename '/home/Shisones/.zshrc'
autoload -Uz compinit
compinit
# Install Zinit on first run
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

fi

# Starter
source "${ZINIT_HOME}/zinit.zsh"
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Goodbye underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
bindkey ';5~' kill-word
bindkey '^H' backward-kill-word


# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

# ----------------------------------
# ALIASES
# ----------------------------------

# GNU Utils-related commands
alias ls='lsd --color=auto --group-directories-first'
alias la='ls -a'
alias ll='ls -l'
alias lcf='ls -CF'
alias find='find . | grep '
alias hist='history'

# Directory-related commands
alias home='cd'
alias docs='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias web='cd /var/www/html'
alias ..='cd ..'

# Pacman-related commands
alias install='sudo pacman -S'
alias uninstall='sudo pacman -Rns'
alias update='sudo pacman -Syu'
alias packages='pacman -Qen'
alias search='pacman -Ss'
alias cleancache='sudo pacman -Sc'

# Paru-related commands
alias paru='paru --batflags "--theme TwoDark"'
alias aur-install='paru -S'
alias aur-uninstall='paru -Rns'
alias aur-update='paru -Syu'
alias aur-packages='paru -Qem'
alias aur-search='paru -Ss'
alias aur-cleancache='paru -Sc'

# Utilities
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias nv='nvim'
alias vim='nvim'
alias snv='sudo nvim'
alias py='python'
alias cat='bat --theme TwoDark'
alias cd='z'
alias preview='fzf --preview="bat --color=always {}"'

# System-related commands
alias root='sudo -i'
alias shutdown='shutdown -h now'
alias system='sudo systemctl'
alias process='ps aux | grep'

# Hyprland-related
alias config='cd ~/Dotfiles/.config/; nv'

# Welcome Neofetch
echo ""
fastfetch -c ~/.config/fastfetch/config.jsonc
