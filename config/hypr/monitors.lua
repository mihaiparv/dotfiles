-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Configure specific monitors.
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 2 })
hl.monitor({ output = "DP-1", mode = "preferred", position = "auto-center-up", scale = 1.6 })
