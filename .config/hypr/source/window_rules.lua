-- =============================================================================
-- WINDOW RULES (Clean Tiling Architecture)
-- Only essential popups, auth dialogs, file pickers, and modals float.
-- Regular desktop apps, utilities, browsers, launchers tile by default.
-- =============================================================================

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

-- -----------------------------------------------------------------------------
-- 1. AUTHENTICATION & POLKIT DIALOGS (MUST FLOAT)
-- -----------------------------------------------------------------------------
hl.window_rule({
    name = "polkit-auth-dialogs",
    match = {
        class = "^(polkit-gnome-authentication-agent-1|io\\.elementary\\.desktop\\.agent-polkit|hyprpolkitagent|org\\.freedesktop\\.impl\\.portal\\.desktop\\.gtk|dusky-polkit)$"
    },
    float = true,
    pin = true,
    center = true,
})

-- -----------------------------------------------------------------------------
-- 2. FILE PICKERS, PORTALS & SYSTEM DIALOGS (MUST FLOAT)
-- -----------------------------------------------------------------------------
hl.window_rule({
    name = "system-dialogs-title",
    match = {
        title = "^(Open|Open File|Select a File|Choose wallpaper|Open Folder|Save As|File Upload|Authentication Required|Add Folder to Workspace|Choose Files|Confirm to replace files|Rename File.*|Save.*)$"
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "system-dialogs-class",
    match = {
        class = "^(org\\.gnome\\.FileRoller|[Xx]dg-desktop-portal-gtk|.*dialog.*)$"
    },
    float = true,
    center = true,
})

-- Screen sharing pickers
hl.window_rule({
    name = "screen-share-picker-hyprland",
    match = { class = "^(hyprland-share-picker)$" },
    float = true,
    center = true,
    size = {560, 360},
})

hl.window_rule({
    name = "screen-share-picker-quickshell",
    match = { class = "^(quickshell-share-picker)$" },
    float = true,
    center = true,
    size = {800, 500},
})

-- -----------------------------------------------------------------------------
-- 3. UTILITY POPUPS (Color pickers, Bluetooth manager popups)
-- -----------------------------------------------------------------------------
hl.window_rule({
    name = "blueman-manager-float",
    match = { class = "^(blueman-manager|blueman-assistant|nm-connection-editor|bluetui)$" },
    float = true,
    center = true,
    size = {650, 450},
})

hl.window_rule({
    name = "pavucontrol-float",
    match = { class = "^(org\\.pulseaudio\\.pavucontrol|pavucontrol|pulsemixer)$" },
    float = true,
    center = true,
    size = {720, 500},
})

hl.window_rule({
    name = "dusky-tui-float",
    match = { class = "^(dusky_tui)$" },
    float = true,
    center = true,
    size = {860, 560},
})

hl.window_rule({
    name = "btop-float",
    match = { class = "^(btop)$" },
    float = true,
    center = true,
    size = {1080, 620},
})

-- -----------------------------------------------------------------------------
-- 4. PERFORMANCE & TEARING (Games)
-- -----------------------------------------------------------------------------
hl.window_rule({
    name = "direct-games-immediate",
    match = { class = "^(minecraft|Minecraft.*|lunarclient|Lunar Client.*|prismlauncher|steam_app_.*|cs2)$" },
    immediate = true,
})

-- -----------------------------------------------------------------------------
-- 5. LAYER RULES (Shell and Overlay Animations)
-- -----------------------------------------------------------------------------
hl.layer_rule({ match = { namespace = "^(selection|hyprpicker)$" }, no_anim = true })
hl.layer_rule({ match = { namespace = "^(quickshell|quickshell-share-picker)$" }, no_anim = true })
