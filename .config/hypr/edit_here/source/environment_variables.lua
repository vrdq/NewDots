-- ==============================================================================
-- USER CONFIGURATION: environment_variables.lua
-- ==============================================================================
-- Add your custom environment variables here.
-- These will override or add to the defaults found in:
--   ~/.config/hypr/source/environment_variables.lua
--
-- NOTE: Environment variables are set directly in this file, which is
-- sourced before Hyprland starts and applies to the full session.
--
-- Syntax:
--   hl.env("XCURSOR_SIZE",    "24")
--   hl.env("HYPRCURSOR_SIZE", "24")
--
-- See: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- ==============================================================================
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_PATH", os.getenv("HOME") .. "/.icons:" .. os.getenv("HOME") .. "/.local/share/icons:/usr/share/icons")
hl.env("TERMINAL", "kitty")
hl.env("FREETYPE_PROPERTIES", "truetype:interpreter-version=40 cff:no-stem-darkening=0 type1:no-stem-darkening=0")
