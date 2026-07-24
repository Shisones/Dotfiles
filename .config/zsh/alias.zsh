# Modern alternatives
alias ls='lsd --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias cat='bat --theme TwoDark'
alias cd='z'
alias nv='nvim'

# Fun stuffs
alias preview='fzf --preview="bat {}"'


# System-related commands
alias root='sudo -i'
alias shutdown='shutdown -h now'
alias system='sudo systemctl'
alias process='ps aux | grep'

# Hyprland-related
alias config='cd ~/Dotfiles/.config/; nv'

