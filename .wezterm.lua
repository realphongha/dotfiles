local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- get OS
local os = wezterm.target_triple
if string.find(os, "windows") then
    os = "windows"
    config.default_prog = { 'powershell.exe' }
elseif string.find(os, "linux") then
    os = "linux"
elseif string.find(os, "apple") then
    os = "macos"
else
    os = "linux"
end

-- font
config.font = wezterm.font(
    "JetBrainsMono Nerd Font",
    { weight = "Bold", }
)
if os == "windows" then
    config.font_size = 11.0
elseif os == "macos" then
    config.font_size = 14.0
else
    config.font_size = 13.0
end

-- colorscheme
config.color_scheme = "rose-pine"

-- background
local wallpaper = ""
if os == "windows" then
    wallpaper = [[D:\For fun\pics\background\reimu.jpg]]
end
if os == "macos" then
    config.window_background_opacity = 0.85
    config.macos_window_background_blur = 30
elseif os == "linux" then
    config.window_background_opacity = 0.9
else
    config.background = {
        {
            source = {
                File = wallpaper,
            },
            hsb = {
                brightness = 0.01,
                hue = 1.0,
                saturation = 1.0,
            },
            height = "Contain",
        }
    }
end

-- tab bar
config.window_frame = {
    font_size = 14.0
}

-- keybindings
config.keys = {
    -- split panes for developing with vi
    {
        key = "v", mods = "ALT",
        action = act.Multiple({
            act.SplitPane { direction = "Down", size = { Percent = 30 }, },
            -- act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        })
    },
    -- kill current pane
    {
        key = "w", mods = "ALT",
        action = act.CloseCurrentPane({ confirm = true })
    },
    -- quick pane select
    {
        key = "s", mods = "ALT",
        action = act.PaneSelect {}
    },
    -- switch pane with vi keybindings
    {
        key = "h", mods = "ALT",
        action = act.ActivatePaneDirection("Left")
    },
    {
        key = "l", mods = "ALT",
        action = act.ActivatePaneDirection("Right")
    },
    {
        key = "j", mods = "ALT",
        action = act.ActivatePaneDirection("Down")
    },
    {
        key = "k", mods = "ALT",
        action = act.ActivatePaneDirection("Up")
    },
}

-- MacOS
if os == "macos" then
    config.use_ime = false
end

return config
