-- # Set programs that you use globally

terminal = "kitty"
fileManager = "thunar"
menu = "hyprlauncher"

-- ######################
-- ### BASIC BINDS ######
-- ######################

hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + A", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("qs -p ~/.config/quickshell/diablo/launcher"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))

-- ######################
-- ### SCREENSHOTS ######
-- ######################

-- Full screen
hl.bind("PRINT",hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshots/"))

-- Region
hl.bind("SHIFT + PRINT",hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots/"))

-- ######################
-- ### WINDOW FOCUS #####
-- ######################

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + LEFT",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + UP",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + DOWN",  hl.dsp.focus({ direction = "down" }))

-- ######################
-- ### WORKSPACES #######
-- ######################

-- Switch workspaces with SUPER + [0-9]
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- ######################################
-- ### MOVE WINDOW TO WORKSPACE #########
-- ######################################

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- ########################
-- ### SPECIAL WORKSPACE ##
-- ########################

-- Toggle special workspace (scratchpad)
hl.bind("SUPER + S",hl.dsp.workspace.toggle_special("magic"))

-- Move active window to special workspace
hl.bind("SUPER + SHIFT + S",hl.dsp.window.move({ workspace = "special:magic" }))

-- ########################
-- ### WORKSPACE SCROLL ###
-- ########################

-- Scroll through existing workspaces

hl.bind("SUPER + mouse_down",hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",hl.dsp.focus({ workspace = "e-1" }))


-- ########################
-- ### MOUSE WINDOW OPS ###
-- ########################

-- Move window with SUPER + Left Mouse Button
hl.bind("SUPER + mouse:272",hl.dsp.window.drag(),{ mouse = true })

-- Resize window with SUPER + Right Mouse Button
hl.bind("SUPER + mouse:273",hl.dsp.window.resize(),{ mouse = true })

-- #################################
-- ### VOLUME / BRIGHTNESS KEYS ###
-- #################################

hl.bind("XF86AudioRaiseVolume",hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),{ locked = true, repeating = true })
hl.bind("XF86AudioMute",hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute",hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),{ locked = true, repeating = true })

-- ########################
-- ### MEDIA KEYS ##########
-- ########################

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),{ locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),{ locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"),{ locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),{ locked = true })
