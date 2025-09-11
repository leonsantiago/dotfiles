local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Config normal
config.initial_cols = 120
config.initial_rows = 28
config.font_size = 12
config.color_scheme = 'rose-pine-moon'
config.font = wezterm.font("GeistMono Nerd Font Mono")
config.window_background_opacity = 0.7

-- Helper para detectar ssh ubuntu
local function parse_ssh_user_host_from_title(title)
  local user, host = title:match("^([%w._-]+)@([%w._-]+)")
  return user, host
end

-- Tab rojo con hostname
wezterm.on("format-tab-title", function(tab, tabs, panes, _config, hover, max_width)
  local title = (tab.active_pane and tab.active_pane.title) or tab.title or ""
  local user, host = parse_ssh_user_host_from_title(title)

  if user == "ubuntu" and host then
    return {
      {Background={Color="red"}},
      {Foreground={Color="white"}},
      {Text=" ⚠ SSH " .. user .. "@" .. host .. " "},
    }
  end

  return { {Text=title} }
end)

-- Cambiar scheme completo cuando es ssh ubuntu
wezterm.on("update-status", function(window, pane)
  local title = pane and pane:get_title() or ""
  local user, host = parse_ssh_user_host_from_title(title)
  local overrides = window:get_config_overrides() or {}

  if user == "ubuntu" and host then
    overrides.color_scheme = "Red Alert"  -- 👈 cambiá este por el que prefieras
    window:set_config_overrides(overrides)
    window:set_right_status(" ⚠ SSH " .. user .. "@" .. host .. " ")
  else
    overrides.color_scheme = 'rose-pine-moon'
    window:set_config_overrides(overrides)
    window:set_right_status("")
  end
end)

return config
