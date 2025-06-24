# GNU Utils-related commands
alias ls='lsd --color=auto --group-directories-first'
alias la='ls -a'
alias ll='ls -l'
alias lcf='ls -CF'
alias hist='history'

# Directory-related commands
alias home='cd'
alias docs='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias dots='cd ~/Dotfiles/'
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
alias nvide='neovide "$@" & disown'
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
