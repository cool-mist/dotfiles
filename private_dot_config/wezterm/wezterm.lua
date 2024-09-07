local wezterm = require 'wezterm'
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.default_prog = { '/usr/bin/bash' }
config.font = wezterm.font('JetBrains Mono Nerd Font')
config.colors = {
  tab_bar = {
    background = '#0b0022',
    active_tab = {
      bg_color = '#2b2042',
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Bold',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
    },
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
    },
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },
  },
}

local act = wezterm.action
config.keys = {
  { key = '}',          mods = 'SHIFT|CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '|',          mods = 'SHIFT|CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '"',          mods = 'SHIFT|CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'T',          mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'z',          mods = 'CTRL',       action = act.TogglePaneZoomState },
  { key = 'w',          mods = 'CTRL',       action = act.CloseCurrentPane { confirm = true } },
  { key = 'H',          mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'L',          mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'K',          mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'J',          mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'LeftArrow',  mods = 'SHIFT|CTRL', action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow',    mods = 'SHIFT|CTRL', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'DownArrow',  mods = 'SHIFT|CTRL', action = act.AdjustPaneSize { 'Down', 5 } },
}
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true

wezterm.on('update-right-status', function(window, pane)
  window:set_left_status ''
  window:set_right_status ''
end)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    return {
      { Text = ' ' .. tab.tab_index + 1 .. ' ' },
    }
  end
)
return config
