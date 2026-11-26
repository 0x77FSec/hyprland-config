-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- Workspace 1: Scrolling layout
hl.workspace_rule({
    workspace = "1",
    layout = "scrolling",
    layout_opts = { direction = "left",
    },
})

-- Workspaces 2-10: Dwindle layout
for i = 2, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        layout = "dwindle",
    })
end



-- ################################
-- ######### Burp Suite ###########
-- ################################

hl.window_rule({match = {class = "^(burp-StartBurp)$",title = "^Burp Suite Community Edition",},float = true,center = true,size = { "1400", "850" },})
hl.window_rule({match = {class = "^(burp-StartBurp)$",title = "^HTTP history filter$",},float = true,center = true,size = { "1000", "650" },})
hl.window_rule({match = {class = "^(burp-StartBurp)$",title = "^Load Burp extension$",},float = true,center = true,size = { "1000", "650" },})
hl.window_rule({match = {class = "^(burp-StartBurp)$",title = "^Settings$",},float = true,center = true,size = { "1400", "850" },})
hl.window_rule({match = {class = "^(burp-StartBurp)$",title = ".*Intruder attack.*",},float = true,center = true,size = { "1400", "850" },})
hl.window_rule({match = {class = "^(burp-StartBurp)$",title = "^Select font$",},float = true,center = true,size = { "1400", "850" },})

-- ################################
-- #### xdg-desktop-portal-gtk ####
-- ################################

hl.window_rule({match = {class = "^(xdg-desktop-portal-gtk)$",title = "^Open File$",},float = true,center = true,size = { "1400", "850" },})

-- ################################
-- #### Obsidian ##################
-- ################################

hl.window_rule({ match = { class = "^(md.obsidian.Obsidian)$", title = "^Settings - .*", }, float = true, center = true, size = { "1400", "850" }, })
hl.window_rule({ match = { class = "^(md.obsidian.Obsidian)$", title = "^(Settings|Community plugins|Community themes|Release Notes).*", }, float = true, center = true, size = { "1000", "650" }, })


hl.window_rule({
    name = "quickshell-launcher",
    match = {
        class = "org.quickshell",
        initial_title = "User Launcher",
    },
    float = true,
    size = { 864, 486 },
    center = true,
})
