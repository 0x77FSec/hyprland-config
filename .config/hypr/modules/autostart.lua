-- #################
-- ### AUTOSTART ###
--#################
-- # Autostart necessary processes (like notifications daemons, status bars, etc.)
-- # Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()

 -- Idle Manager(remove this if this is already running)
    hl.exec_cmd("hypridle")

  -- Notification daemon
    hl.exec_cmd("swaync")

  -- Update Environment Variables for tray apps
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  
  -- Tray Applications
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")

  -- Waybar
    hl.exec_cmd("waybar")
  
  -- Wallpaper Daemon
    hl.exec_cmd("sleep 0.2 && ~/.config/hypr/awww.sh")

end)

-- ################################
-- ####### CUSTOM CONFIG #########
-- ################################

-- Clear the screen on Hyprland startup to remove leftover boot text
hl.on("hyprland.start", function()
    hl.exec_cmd([[sh -c 'printf "\033c" > /dev/tty1']])
end)
