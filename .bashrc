[[ $- != *i* ]] && return

for f in ~/.config/bash/*.sh; do
    [ -r "$f" ] && source "$f"
done
unset f
