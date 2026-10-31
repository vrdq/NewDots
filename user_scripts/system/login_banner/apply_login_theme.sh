#!/usr/bin/env bash
# ==============================================================================
# apply_login_theme.sh — Set up the VRDQ Delta Corps Priest greeter
# ==============================================================================
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    exec sudo "$0" "$@"
fi

# 1. Update /etc/vconsole.conf for high-res crisp Terminus console font
cat > /etc/vconsole.conf << 'EOF'
KEYMAP=us
XKBLAYOUT=us
FONT=ter-v28b
EOF

# 2. Update /etc/issue with the VRDQ Delta Corps Priest pixel banner
cat > /etc/issue << 'EOF'
\e[1;32m
     ▄█    █▄     ▄████████ ████████▄  ████████▄   
    ███    ███   ███    ███ ███   ▀███ ███    ███  
    ███    ███   ███    ███ ███    ███ ███    ███  
    ███    ███  ▄███▄▄▄▄██▀ ███    ███ ███    ███  
    ███    ███ ▀▀███▀▀▀▀▀   ███    ███ ███    ███  
    ███    ███ ▀███████████ ███    ███ ███    ███  
    ███    ███   ███    ███ ███   ▄███ ███  ▀ ███  
     ▀██████▀    ███    ███ ████████▀   ▀██████▀▄█ 
                 ███    ███                        
\e[0m
EOF

# 3. Configure /etc/greetd/config.toml with clean Omarchy-inspired tuigreet
cat > /etc/greetd/config.toml << 'EOF'
[terminal]
vt = 1

[default_session]
command = "tuigreet --time --time-format '%A, %d %B %Y' --issue --remember --remember-session --asterisks --asterisks-char '•' --width 56 --container-padding 2 --theme 'border=green;title=lightgreen;prompt=green;action=lightgreen;button=darkgray;container=black;input=white' --cmd /usr/local/bin/wayland-session"
user = "greeter"
EOF

# Ensure systemd-vconsole-setup takes effect immediately
if command -v /usr/lib/systemd/systemd-vconsole-setup &>/dev/null; then
    /usr/lib/systemd/systemd-vconsole-setup || true
fi

echo "Login screen configured successfully with VRDQ Delta Corps banner."
