# External tool initializations
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Welcome message with fastfetch
echo ""
fastfetch -c ~/.config/fastfetch/config.jsonc
