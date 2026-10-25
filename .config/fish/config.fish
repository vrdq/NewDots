# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GIT_EDITOR nvim

# Ensure user local bin is on PATH
fish_add_path -g $HOME/.local/bin

# Optional runtime paths (only added if present on disk)
if test -d "$HOME/.bun"
    set --export BUN_INSTALL "$HOME/.bun"
    fish_add_path -g $BUN_INSTALL/bin
end

if test -d "$HOME/.spicetify"
    fish_add_path -g "$HOME/.spicetify"
end

# Non-interactive shells exit here
status is-interactive; or return

# Interactive session setup
set -g fish_greeting ""
set -g fish_key_bindings fish_user_key_bindings

# Icon-aware directory listings with fallback to standard ls
if type -q eza
    alias ls='eza --icons --group-directories-first'
    alias ll='eza --icons --group-directories-first --long --all --header --classify'
    alias la='eza --icons --group-directories-first --all --classify'
else
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias la='ls -A --color=auto'
end

if type -q fastfetch
    alias ff='fastfetch'
end

function fish_title
end

if type -q starship
    starship init fish | source
end
