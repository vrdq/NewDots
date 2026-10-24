-- ==============================================================================
-- USER CONFIGURATION: input.lua
-- Sourced via edit_here/hyprland.lua to override input defaults.
-- ==============================================================================

-- ── Dedicated Touchpad & Mouse Device Overrides ──────────────────────────────
hl.device({
    name = "elan06fa:00-04f3:327e-touchpad",
    accel_profile = "adaptive",
    sensitivity = 0.0,
    disable_while_typing = true,
    tap_to_click = false,
    clickfinger_behavior = false,
})

hl.device({
    name = "elan06fa:00-04f3:327e-mouse",
    disable_while_typing = true,
    tap_to_click = false,
})

-- ── Global Input Configuration ────────────────────────────────────────────────
hl.config({
    input = {
        -- Keyboard
        kb_layout          = "us",
        repeat_rate        = 50,
        repeat_delay       = 280,
        numlock_by_default = true,

        -- Mouse & Pointer (Flat / Raw 1:1, low sensitivity)
        follow_mouse       = 1,
        sensitivity        = -0.8,
        accel_profile      = "flat",

        -- Touchpad
        touchpad = {
            tap_to_click            = false,
            natural_scroll          = true,
            scroll_factor           = 0.3,
            disable_while_typing    = true,
            clickfinger_behavior    = false,
            middle_button_emulation = false,
        },
    },
})
