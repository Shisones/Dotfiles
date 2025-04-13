# If not running interactively, don't do anything
[[ $- != *i* ]] && return

color_prompt=yes

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

# Functions
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       rar x $1       ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "I don't know how to extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Shell control
eval "$(thefuck --alias)"
eval "$(zoxide init bash)"

# Welcome Neofetch
echo ""
fastfetch -c ~/.config/fastfetch/config.jsonc
echo ""

# Hyprland-related
alias config='cd ~/Dotfiles/.config/; nv'

# Prompt 
WHITE="\[\033[01;37m\]"
GRAY="\[\033[01;30m\]"
LIGHT_BLUE="\033[01;36m\]"
GREEN="\[\033[01;32m\]"

PS1="${WHITE}[${GRAY}\u${WHITE}@${LIGHT_BLUE}\h${WHITE}] on ${GREEN}\t${WHITE} [\W]${WHITE}\n 󰁕 "
unset color_prompt force_color_prompt
