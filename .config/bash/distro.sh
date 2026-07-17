if [ -r /etc/os-release ]; then
    . /etc/os-release
    DISTRO_ID="$ID"
elif command -v lsb_release >/dev/null 2>&1; then
    DISTRO_ID="$(lsb_release -si | tr '[:upper:]' '[:lower:]')"
else
    DISTRO_ID="unknown"
fi

case "$DISTRO_ID" in
    arch)
        alias install='sudo pacman -S'
        alias uninstall='sudo pacman -Rns'
        alias update='sudo pacman -Syu'
        alias packages='pacman -Qen'
        alias search='pacman -Ss'
        alias cleancache='sudo pacman -Scc'
        alias paru='paru --batflags "--theme TwoDark"'
        alias aur-install='paru -S'
        alias aur-uninstall='paru -Rns'
        alias aur-update='paru -Syu'
        alias aur-packages='paru -Qem'
        alias aur-search='paru -Ss'
        alias aur-cleancache='paru -Scc'
        ;;
    fedora)
        alias install='sudo dnf install'
        alias uninstall='sudo dnf remove'
        alias update='sudo dnf update'
        alias packages='dnf list installed'
        alias search='dnf search'
        alias cleancache='sudo dnf clean all'
        ;;
    debian | ubuntu)
        alias install='sudo apt install'
        alias uninstall='sudo apt remove'
        alias update='sudo apt update && sudo apt upgrade'
        alias packages='apt list --installed'
        alias search='apt search'
        alias cleancache='sudo apt autoclean && sudo apt autoremove'
        ;;
esac
