-- Under Migration 

-- ################
-- ### MONITORS ###
-- ################

hl.monitor({
  output = " ", -- User Your Monitor Name
  mode = "preferred",
  position = "auto",
  scale = 1.0,
})


-- # Set programs that you use gloablly
terminal = "kitty"
fileManager = "dolphin"
menu = "hyprlauncher"


-- #################
-- ### AUTOSTART ###
--#################
-- # Autostart necessary processes (like notifications daemons, status bars, etc.)
-- # Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
  
  -- Idle Manager
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

  

-- # Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + r", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + l", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + F", hl.dsp.fullscreen())
hl.bind("SUPER + P", hl.dsp.pseudo())
hl.bind("SUPER + C", hl.dsp.killactive())
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", hl.dsp.togglefloating())
hl.bind("SUPER + A", hl.dsp.layout("togglesplit"))


-- Screenshot - Full screen
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshots/"))

-- Screenshot - Region
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots/"))

-- ######################
-- ### WINDOW FOCUS #####
-- ######################

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + LEFT",  hl.dsp.movefocus("l"))
hl.bind("SUPER + RIGHT", hl.dsp.movefocus("r"))
hl.bind("SUPER + UP",    hl.dsp.movefocus("u"))
hl.bind("SUPER + DOWN",  hl.dsp.movefocus("d"))


-- ######################
-- ### WORKSPACES #######
-- ######################

-- Switch workspaces with SUPER + [0-9]
hl.bind("SUPER + 1", hl.dsp.workspace(1))
hl.bind("SUPER + 2", hl.dsp.workspace(2))
hl.bind("SUPER + 3", hl.dsp.workspace(3))
hl.bind("SUPER + 4", hl.dsp.workspace(4))
hl.bind("SUPER + 5", hl.dsp.workspace(5))
hl.bind("SUPER + 6", hl.dsp.workspace(6))
hl.bind("SUPER + 7", hl.dsp.workspace(7))
hl.bind("SUPER + 8", hl.dsp.workspace(8))
hl.bind("SUPER + 9", hl.dsp.workspace(9))
hl.bind("SUPER + 0", hl.dsp.workspace(10))


-- ######################################
-- ### MOVE WINDOW TO WORKSPACE #########
-- ######################################

-- Move active window with SUPER + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + 1", hl.dsp.movetoworkspace(1))
hl.bind("SUPER + SHIFT + 2", hl.dsp.movetoworkspace(2))
hl.bind("SUPER + SHIFT + 3", hl.dsp.movetoworkspace(3))
hl.bind("SUPER + SHIFT + 4", hl.dsp.movetoworkspace(4))
hl.bind("SUPER + SHIFT + 5", hl.dsp.movetoworkspace(5))
hl.bind("SUPER + SHIFT + 6", hl.dsp.movetoworkspace(6))
hl.bind("SUPER + SHIFT + 7", hl.dsp.movetoworkspace(7))
hl.bind("SUPER + SHIFT + 8", hl.dsp.movetoworkspace(8))
hl.bind("SUPER + SHIFT + 9", hl.dsp.movetoworkspace(9))
hl.bind("SUPER + SHIFT + 0", hl.dsp.movetoworkspace(10))

-- ########################
-- ### SPECIAL WORKSPACE ###
-- ########################

-- Toggle special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace("special:magic"))

-- Move active window to special workspace
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({workspace = "special:magic"}))


-- ########################
-- ### WORKSPACE SCROLL ###
-- ########################

-- Scroll through existing workspaces
hl.bind("SUPER + mouse_down", hl.dsp.focus({workspace = "e+1"}))

hl.bind("SUPER + mouse_up", hl.dsp.focus({workspace = "e-1"}))


-- ########################
-- ### MOUSE WINDOW OPS ###
-- ########################

-- Move window with SUPER + Left Mouse Button
hl.bind(    "SUPER + mouse:272", hl.dsp.window.drag(),{ mouse = true })

-- Resize window with SUPER + Right Mouse Button
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })




