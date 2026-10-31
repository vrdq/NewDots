#!/usr/bin/env bash
# ==============================================================================
# apply_login_theme.sh — All-white minimal VRDQ login screen (tuigreet)
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

# 2. Update /etc/issue with the all-white VRDQ pixel banner (no system/kernel/tty info)
cat > /etc/issue << 'EOF'
\e[1;37m
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

# 3. Configure /etc/greetd/config.toml (All-white, no date/time/battery/sessions/extra text)
cat > /etc/greetd/config.toml << 'EOF'
[terminal]
vt = 1

[default_session]
command = "tuigreet --issue --remember --remember-session --asterisks --asterisks-char '•' --width 56 --container-padding 2 --theme 'border=white;title=white;prompt=white;action=white;button=black;container=black;input=white' --cmd /usr/local/bin/wayland-session"
user = "greeter"
EOF

# Ensure systemd-vconsole-setup takes effect immediately
if command -v /usr/lib/systemd/systemd-vconsole-setup &>/dev/null; then
    /usr/lib/systemd/systemd-vconsole-setup || true
fi

echo "Login screen configured successfully: all-white minimal VRDQ greeter."
