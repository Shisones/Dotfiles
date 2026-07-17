# pkg — distro-agnostic package manager wrapper

function _pkg_detect() {
    command -v pacman &>/dev/null && echo "pacman" && return
    command -v apt    &>/dev/null && echo "apt"    && return
    command -v dnf    &>/dev/null && echo "dnf"    && return
    command -v zypper &>/dev/null && echo "zypper" && return
    echo ""
}

function _pkg_flags() {
    case $1 in
        pacman) pm_install="-S"; pm_remove="-Rns"; pm_update="-Sy"; pm_upgrade="-Syu"
                pm_search="-Ss"; pm_clean="-Scc"; pm_list="-Qen"; pm_info="-Qi"    ;;
        apt)    pm_install="install"; pm_remove="remove"; pm_update="update"; pm_upgrade="upgrade"
                pm_search="search"; pm_clean="autoclean"; pm_list="list --installed"; pm_info="show" ;;
        dnf)    pm_install="install"; pm_remove="remove"; pm_update="makecache"; pm_upgrade="upgrade"
                pm_search="search"; pm_clean="clean all"; pm_list="list installed"; pm_info="info" ;;
        zypper) pm_install="install"; pm_remove="remove"; pm_update="refresh"; pm_upgrade="update"
                pm_search="search"; pm_clean="clean"; pm_list="se --installed-only"; pm_info="info" ;;
    esac
}

function _pkg_run() {
    local sudo="sudo"
    [[ $(id -u) -eq 0 ]] && sudo=""

    local pm=$1; shift
    local pm_install pm_remove pm_update pm_upgrade
    local pm_search pm_clean pm_list pm_info
    _pkg_flags $pm

    case $1 in
        install)   shift; $sudo $pm $pm_install "$@" ;;
        uninstall) shift; $sudo $pm $pm_remove "$@"  ;;
        update)           $sudo $pm $pm_update       ;;
        upgrade)          $sudo $pm $pm_upgrade      ;;
        search)   shift;         $pm $pm_search "$@" ;;
        clean)            $sudo $pm $pm_clean        ;;
        list)                     $pm $pm_list       ;;
        info)     shift;         $pm $pm_info "$@"   ;;
        *)                     $pm "$@"              ;;
    esac
}

function _pkg_aur() {
    local aur
    if   command -v paru &>/dev/null; then aur=paru
    elif command -v yay  &>/dev/null; then aur=yay
    else echo "pkg aur: no AUR helper found (install paru or yay)" >&2; return 1
    fi

    case $1 in
        install)   shift; $aur -S   "$@" ;;
        uninstall) shift; $aur -Rns "$@" ;;
        update)           $aur -Sy      ;;
        upgrade)          $aur -Syu     ;;
        search)   shift; $aur -Ss  "$@" ;;
        clean)            $aur -Scc     ;;
        list)             $aur -Qem     ;;
        info)     shift; $aur -Qi  "$@" ;;
        *)                $aur "$@"     ;;
    esac
}

function pkg() {
    local pm=$(_pkg_detect)
    [[ -z $pm ]] && { echo "pkg: no supported package manager found" >&2; return 1 }

    case $1 in
        aur) shift; _pkg_aur "$@" ;;
        *)   _pkg_run $pm "$@"   ;;
    esac
}
