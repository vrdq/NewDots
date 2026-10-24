-- -----------------------------------------------------------------
-- Hyprland GPU | Mode: AUTO | Primary: /dev/dri/card1
-- GPU: NVIDIA | NVIDIA Corporation AD107M [GeForce RTX 4050 Max-Q / Mobile] (rev a1) | 0000:01:00.0 | drv:nvidia
-- Gen: Python 3.14.6 + Rich + pyudev | systemd 261 | Hyprland 0.55.4+ Lua
-- DRM nodes shift per reboot - resolved via stable by-path
-- -----------------------------------------------------------------
local function resolve_card(pci_address, fallback)
 local cmd = "for d in /dev/dri/by-path/pci-"..pci_address.."*card; do [ -e \"$d\" ] && readlink -f \"$d\" 2>/dev/null && break; done"
 local h = io.popen(cmd)
 if h then
 local path = h:read("*l")
 h:close()
 if path and path ~= "" then return path end
 end
 return fallback
end

hl.env("AQ_DRM_DEVICES", resolve_card("0000:01:00.0", "/dev/dri/card1"))

-- NVIDIA Proprietary
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
