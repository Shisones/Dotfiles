# Impacket Alias Wrapper
function load_impacket_aliases() {
    # Comprehensive tool list as of the current Impacket release
    local -a impacket_tools=(
        addcomputer atexec dcomexec dpapi esentutl findDelegation
        GetADUsers GetNPUsers getPac getST getTGT GetUserSPNs
        goldenPac karmaSMB kintercept lookupsid machine_role mapexec
        mimikatz mqtt_check mssqlclient mssqllin netview ntlmrelayx
        ping6 psexec raiseChild rbcd rdp_check reg rpcdump
        samrdump secretsdump services smbclient smbexec smbrelayx
        smbserver sniff sniffer snmp-brute split ticketer ticketConverter
        wmiexec wmipersist wmiquery
    )

    # Search paths covering pipx, manual pip, native Arch packages, and source clones
    local search_paths=(
        "$HOME/.local/bin" 
        "/usr/bin" 
        "/usr/share/doc/python-impacket/examples" 
        "/opt/impacket/examples"
    )
    local mapped_count=0

    for tool in "${impacket_tools[@]}"; do
        local target_bin=""
        
        # Check all possible naming conventions Arch might use
        for base_path in "${search_paths[@]}"; do
            if [[ -x "$base_path/$tool.py" ]]; then
                target_bin="$base_path/$tool.py"
                break
            elif [[ -x "$base_path/impacket-$tool" ]]; then
                target_bin="$base_path/impacket-$tool"
                break
            elif [[ -x "$base_path/$tool" ]]; then
                target_bin="$base_path/$tool"
                break
            fi
        done

        # Map aliases if the binary is found and executable
        if [[ -n "$target_bin" ]]; then
            # Force Kali-style prefix mapping
            alias "impacket-$tool"="$target_bin"
            
            # Map the naked tool name ONLY if it does not conflict with a system binary
            if ! command -v "$tool" >/dev/null 2>&1; then
                alias "$tool"="$target_bin"
            fi
            ((mapped_count++))
        fi
    done

    # Fail loud if nothing was mapped
    if [[ $mapped_count -eq 0 ]]; then
        echo "[!] Warning: Impacket scripts not found. Verify installation or update search_paths." >&2
    fi
}

load_impacket_aliases
