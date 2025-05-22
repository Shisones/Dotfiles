# External tool initializations
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Welcome message with fastfetch
echo ""
fastfetch -c ~/.config/fastfetch/config.jsonc
