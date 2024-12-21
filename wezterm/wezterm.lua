local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

local move_around = function(window, pane, direction_wez, direction_nvim)
    local result = os.execute("env NVIM_LISTEN_ADDRESS=/tmp/nvim" .. pane:pane_id() .. " " .. wezterm.home_dir .. "/.local/bin/wezterm.nvim.navigator" .. " " .. direction_nvim)
    if result then
		window:perform_action(
            act({ SendString = "\x17" .. direction_nvim }),
            pane
        )
    else
        window:perform_action(
            act({ ActivatePaneDirection = direction_wez }),
            pane
        )
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

local vim_resize = function(window, pane, direction_wez, direction_nvim)
	local result = os.execute(
		"env NVIM_LISTEN_ADDRESS=/tmp/nvim"
			.. pane:pane_id()
			.. " "
            .. wezterm.home_dir
			.. "/.local/bin/wezterm.nvim.navigator"
			.. " "
			.. direction_nvim
	)
	if result then
		window:perform_action(act({ SendString = "\x1b" .. direction_nvim }), pane)
	else
		window:perform_action(act({ ActivatePaneDirection = direction_wez }), pane)
	end
end

wezterm.on("resize-left", function(window, pane)
	vim_resize(window, pane, "Left", "h")
end)

wezterm.on("resize-right", function(window, pane)
	vim_resize(window, pane, "Right", "l")
end)

wezterm.on("resize-up", function(window, pane)
	vim_resize(window, pane, "Up", "k")
end)

wezterm.on("resize-down", function(window, pane)
	vim_resize(window, pane, "Down", "j")
end)

config.color_scheme = 'nightfox'
config.font = wezterm.font 'JetBrains Mono'
config.window_decorations = 'NONE'
config.font_size = 13.0
config.pane_focus_follows_mouse = true
config.tab_bar_at_bottom = true
config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 2000,
}

-- Custom key bindings
config.keys = {
    -- -- Disable Alt-Enter combination (already used in tmux to split pane)
    -- {
    --     key = 'Enter',
    --     mods = 'ALT',
    --     action = act.DisableDefaultAssignment,
    -- },

    -- Copy mode
    {
        key = '[',
        mods = 'LEADER',
        action = act.ActivateCopyMode,
    },

    -- ----------------------------------------------------------------
    -- TABS
    --
    -- Where possible, I'm using the same combinations as I would in tmux
    -- ----------------------------------------------------------------

    -- Show tab navigator; similar to listing panes in tmux
    {
        key = 'w',
        mods = 'LEADER',
        action = act.ShowTabNavigator,
    },
    -- Create a tab (alternative to Ctrl-Shift-Tab)
    {
        key = 'c',
        mods = 'LEADER',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
    -- Rename current tab; analagous to command in tmux
    {
        key = ',',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(
                function(window, pane, line)
                    if line then
                        window:active_tab():set_title(line)
                    end
                end
            ),
        },
    },
    -- Move to next/previous TAB
    {
        key = 'n',
        mods = 'LEADER',
        action = act.ActivateTabRelative(1),
    },
    {
        key = 'p',
        mods = 'LEADER',
        action = act.ActivateTabRelative(-1),
    },
    -- Close tab
    {
        key = '&',
        mods = 'LEADER|SHIFT',
        action = act.CloseCurrentTab{ confirm = true },
    },

    -- ----------------------------------------------------------------
    -- PANES
    --
    -- These are great and get me most of the way to replacing tmux
    -- entirely, particularly as you can use "wezterm ssh" to ssh to another
    -- server, and still retain Wezterm as your terminal there.
    -- ----------------------------------------------------------------

    -- -- Vertical split
    {
        -- |
        key = '|',
        mods = 'LEADER|SHIFT',
        action = act.SplitPane {
            direction = 'Right',
            size = { Percent = 50 },
        },
    },
    -- Horizontal split
    {
        -- -
        key = '-',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Down',
            size = { Percent = 50 },
        },
    },
    -- CTRL + (h,j,k,l) to move between panes
    {
        key = 'h',
        mods = 'LEADER',
        action = act({ EmitEvent = "move-left" }),
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = act({ EmitEvent = "move-down" }),
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = act({ EmitEvent = "move-up" }),
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = act({ EmitEvent = "move-right" }),
    },
    -- ALT + (h,j,k,l) to resize panes
    {
        key = 'h',
        mods = 'LEADER|SHIFT',
        action = act({ EmitEvent = "resize-left" }),
    },
    {
        key = 'j',
        mods = 'LEADER|SHIFT',
        action = act({ EmitEvent = "resize-down" }),
    },
    {
        key = 'k',
        mods = 'LEADER|SHIFT',
        action = act({ EmitEvent = "resize-up" }),
    },
    {
        key = 'l',
        mods = 'LEADER|SHIFT',
        action = act({ EmitEvent = "resize-right" }),
    },
    -- Close/kill active pane
    {
        key = 'x',
        mods = 'LEADER',
        action = act.CloseCurrentPane { confirm = true },
    },
    -- Swap active pane with another one
    {
        key = '{',
        mods = 'LEADER|SHIFT',
        action = act.PaneSelect { mode = "SwapWithActiveKeepFocus" },
    },
    -- Zoom current pane (toggle)
    {
        key = 'z',
        mods = 'LEADER',
        action = act.TogglePaneZoomState,
    },
    {
        key = 'f',
        mods = 'ALT',
        action = act.TogglePaneZoomState,
    },
    -- Move to next/previous pane
    {
        key = ';',
        mods = 'LEADER',
        action = act.ActivatePaneDirection('Prev'),
    },
    {
        key = 'o',
        mods = 'LEADER',
        action = act.ActivatePaneDirection('Next'),
    },
}
return config
