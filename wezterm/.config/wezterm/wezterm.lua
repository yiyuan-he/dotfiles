-- Pull in the wezterm API
local wezterm = require("wezterm")
local os = require("os")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.font = wezterm.font("Berkeley Mono")
config.font_size = 15

config.color_scheme = "NvimDark"

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true
config.debug_key_events = true
config.tab_max_width = 32
config.colors = {
  tab_bar = {
    background = "#14161b",
    active_tab = {
      fg_color = "#e0e2ea",
      bg_color = "#14161b"
    },
    inactive_tab = {
      fg_color = "#e0e2ea",
      bg_color = "#14161b"
    },
    new_tab = {
      fg_color = "#e0e2ea",
      bg_color = "#14161b"
    }
  }
}

config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseonds = 2000
}

local move_around = function(window, pane, direction_wez, direction_nvim)
  local result = os.execute("env NVIM_LISTEN_ADDRESS=/tmp/nvim" .. pane:pane_id() ..  " wezterm.nvim.navigator " .. direction_nvim)
  if result then
    window:perform_action(wezterm.action({ SendString = "\x17" .. direction_nvim }), pane)
  else
    window:perform_action(wezterm.action({ ActivatePaneDirection = direction_wez }), pane)
  end
end

wezterm.on("move-left", function(window, pane)
  move_around(window, pane, "Left", "h")
end)

wezterm.on("move-right", function(window, pane)
  move_around(window, pane, "Right", "l")
end)

wezterm.on("move-up", function(window, pane)
  move_around(window, pane, "Up", "k")
end)

wezterm.on("move-down", function(window, pane)
  move_around(window, pane, "Down", "j")
end)


config.keys = {
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  { key = "b", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
  -- Make Option-Right equivalent to Alt-f; forward-word
  { key = "f", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
  { key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
  { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
  { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab "CurrentPaneDomain" },
  { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
  {
    key = ",", mods = "LEADER", action = wezterm.action.PromptInputLine {
      description = "Enter new name for tab",
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  { key = "w", mods = "LEADER", action = wezterm.action.ShowTabNavigator },
  { key = "%", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = '"', mods = "LEADER|SHIFT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "Enter", mods="SHIFT", action = wezterm.action{SendString="\x1b\r" } },
  -- pane move(vim aware)
  { key = "h", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-left" }) },
  { key = "l", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-right" }) },
  { key = "k", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-up" }) },
  { key = "j", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-down" }) },
}

return config
