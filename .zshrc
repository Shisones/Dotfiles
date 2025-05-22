# Source all .zsh files in ~/.config/zsh
for file in ~/.config/zsh/*.zsh; do
    [ -r "$file" ] && source "$file"
done
unset file
