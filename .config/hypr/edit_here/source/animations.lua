-- -----------------------------------------------------------------------------
-- HARMONIZED ANIMATIONS (Clean & Snappy - Zero Overshoot)
-- Sourced directly from your personal dotfiles (~/dotfiles/.config/hypr/hyprland.lua)
-- -----------------------------------------------------------------------------

hl.curve("smoothOut", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })

-- Harmonized animation set (workspaces/layers/popins at speed 4; fullscreen/movement on smoothOut)
hl.animation({ leaf = "global",           enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4,   bezier = "default", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4,   bezier = "default", style = "slidevert" })
hl.animation({ leaf = "windows",          enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 4,   bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 4,   bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 5.5, bezier = "smoothOut" })
hl.animation({ leaf = "fade",             enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "layers",           enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 4,   bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "layersOut",        enabled = false })
hl.animation({ leaf = "border",           enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "borderangle",      enabled = false, speed = 100, bezier = "linear" })
