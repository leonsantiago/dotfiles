local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- === Schemes ===
local DARK_SCHEME  = 'rose-pine-moon'
local LIGHT_SCHEME = 'rose-pine-dawn'

local CURRENT_SCHEME = DARK_SCHEME

-- Config normal
config.initial_cols = 120
config.initial_rows = 28
config.font_size = 12
config.color_scheme = DARK_SCHEME
config.font = wezterm.font("JetBrains Mono SemiBold")
config.window_background_opacity = 0.7

-- === Toggle Light/Dark con Ctrl+Shift+L ===
wezterm.on("toggle-colorscheme", function(window, _)
  local overrides = window:get_config_overrides() or {}
  -- miro primero override actual; si no hay, uso lo que recuerde el proceso
  local now = overrides.color_scheme or CURRENT_SCHEME or config.color_scheme
  local next = (now == LIGHT_SCHEME) and DARK_SCHEME or LIGHT_SCHEME
  overrides.color_scheme = next
  window:set_config_overrides(overrides)
  CURRENT_SCHEME = next
end)

config.keys = config.keys or {}
table.insert(config.keys, {
  key = "L",
  mods = "CTRL|SHIFT",
  action = wezterm.action.EmitEvent("toggle-colorscheme"),
})

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
    overrides.color_scheme = "Red Alert"  -- 👈 cambiá este por el que prefieras para SSH
    window:set_config_overrides(overrides)
    window:set_right_status(" ⚠ SSH " .. user .. "@" .. host .. " ")
  else
    -- cuando NO es ssh ubuntu, respetamos el esquema actual (incluye el toggle)
    overrides.color_scheme = CURRENT_SCHEME
    window:set_config_overrides(overrides)
    window:set_right_status("")
  end
end)

return config
