-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- JSON Loading stuff for reading the pywal colors
-- Load cjson using luarocks
local json = require("json")

local colorizer = require("colorizer")

local json_file = io.open(os.getenv("HOME") .. "/.cache/wal/colors.json", "r")

local icon_file = os.getenv("HOME") .. "/.config/awesome/icons/menu.png"
local tag_icons = {
	os.getenv("HOME") .. "/.config/awesome/icons/one.png",
	os.getenv("HOME") .. "/.config/awesome/icons/firecuter.png",
	os.getenv("HOME") .. "/.config/awesome/icons/coded.png",
	os.getenv("HOME") .. "/.config/awesome/icons/vscode.png",
	os.getenv("HOME") .. "/.config/awesome/icons/movies.png",
	os.getenv("HOME") .. "/.config/awesome/icons/coder.png",
	os.getenv("HOME") .. "/.config/awesome/icons/slack.png",
	os.getenv("HOME") .. "/.config/awesome/icons/twitch.png",
	os.getenv("HOME") .. "/.config/awesome/icons/zoom.png",
}


if not json_file then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = "colors.json not found"
	})
end

local json_string
if json_file ~= nil then
	json_string = json_file:read("*a")
end


if not json_string then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = "colors.json not found"
	})
end

local colors = json.decode(json_string)

if not colors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = "colors.json empty"
	})
end


-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err)
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- INLINE THEME
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.font = "Monaspace Neon 12"
beautiful.bg_normal = colorizer(colors.colors.color1)
beautiful.fg_normal = colorizer(colors.special.background)
beautiful.awesome_icon = icon_file
--beautiful.taglist_icons = tag_icons

-- enable gaps
beautiful.useless_gap = 0
beautiful.border_width = 1

-- colors for the focused and unfocused mode
beautiful.border_focus = colors.colors.color6
beautiful.border_normal = colors.colors.color8

-- END

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile.left,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}



-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{ "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "manual",      terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart",     awesome.restart },
	{ "quit",        function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
	mymainmenu = freedesktop.menu.build({
		before = { menu_awesome },
		after = { menu_terminal }
	})
else
	mymainmenu = awful.menu({
		items = {
			menu_awesome,
			{ "Debian", debian.menu.Debian_menu.Debian },
			menu_terminal,
		}
	})
end


mylauncher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{ raise = true }
			)
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end))

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)

screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	-- Not setting wallpaper because I am setting wallpaper with the feh
	--set_wallpaper(s)


	-- add the icons
	for i, tag_icon in ipairs(tag_icons) do
		awful.tag.add(i, {
			icon = tag_icon,
			layout = awful.layout.suit.tile.left,
			screen = s,
			icon_only = true,
		}
		)
	end

	-- iterate through the taglist and set the icons from the tag_icons table

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function() awful.layout.inc(1) end),
		awful.button({}, 3, function() awful.layout.inc(-1) end),
		awful.button({}, 4, function() awful.layout.inc(1) end),
		awful.button({}, 5, function() awful.layout.inc(-1) end)))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
		screen          = s,
		filter          = awful.widget.taglist.filter.all,
		buttons         = taglist_buttons,
		style           = {
			shape = gears.shape.rounded_rect,
		},
		widget_template = {
			{
				{
					{
						{
							{
								id     = 'index_role',
								widget = wibox.widget.textbox,
							},
							margins = 4,
							widget  = wibox.container.margin,
						},
						widget = wibox.container.background,
					},
					{
						{
							id     = 'icon_role',
							widget = wibox.widget.imagebox,
						},
						margins = 2,
						widget  = wibox.container.margin,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left   = 5,
				right  = 5,
				widget = wibox.container.margin
			},
			id              = 'background_role',
			widget          = wibox.container.background,
			-- -- Add support for hover colors and an index label
			create_callback = function(self, c3, index, objects) --luacheck: no unused args
				-- self:get_children_by_id('index_role')[1].markup = '<b> ' .. index .. ' </b>'
				self:connect_signal('mouse::enter', function()
					if self.bg ~= colors.colors.color3 then
						self.backup     = self.bg
						self.has_backup = true
					end
					self.bg = colors.colors.color5
					-- increase the size
				end)
				self:connect_signal('mouse::leave', function()
					if self.has_backup then self.bg = self.backup end
				end)
			end,
			update_callback = function(self, c3, index, objects) --luacheck: no unused args
				-- self:get_children_by_id('index_role')[1].markup = '<b> ' .. index .. ' </b>'
			end,
		},
	}

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen  = s,
		-- Enable or disable the names on the top of the bar
		--filter  = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons
	}

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = 60, visible = false, border_width = 10 })
	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.container.margin(mylauncher, 20, 0, 0, 0),
			spacing = 5,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{       -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			wibox.widget.systray(),
			s.mylayoutbox,
			mytextclock,

		},
	}
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function() mymainmenu:toggle() end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

-- bindings to change the volume
	awful.key({}, "XF86AudioLowerVolume", function()
			awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
		end,
		{ description = "lower volume", group = "system" }
	),
	awful.key({}, "XF86AudioRaiseVolume", function()
			awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
		end,
		{ description = "raise voluem", group = "system" }
	),
	awful.key(
		{}, "XF86MonBrightnessDown",
		function()
			awful.spawn("brightnessctl s 5%-")
		end,
		{ description = "decrease brightness", group = "system" }
	),
	awful.key(
		{}, "XF86MonBrightnessUp",
		function()
			awful.spawn("brightnessctl s 5%+")
		end,
		{ description = "decrease brightness", group = "system" }
	),
	--toggle wibar
	awful.key({ modkey }, "b",
		function()
			for s in screen do
				s.mywibox.visible = not s.mywibox.visible
			end
		end
	),
	awful.key({ modkey, "Shift" }, "f",
		function()
			awful.spawn("firefox")
		end
	),
	awful.key({ modkey, }, "m",
		function(c)
			awful.spawn("rofi -show drun")
		end,
		{ description = "Open the rofi window", group = "menu" }),
	awful.key({ modkey, }, "s", hotkeys_popup.show_help,
		{ description = "show help", group = "awesome" }),
	awful.key({ modkey, }, "Left", awful.tag.viewprev,
		{ description = "view previous", group = "tag" }),
	awful.key({ modkey, }, "Right", awful.tag.viewnext,
		{ description = "view next", group = "tag" }),
	awful.key({ modkey, }, "Escape", awful.tag.history.restore,
		{ description = "go back", group = "tag" }),

	awful.key({ modkey, }, "j",
		function()
			awful.client.focus.byidx(1)
		end,
		{ description = "focus next by index", group = "client" }
	),
	awful.key({ modkey, }, "k",
		function()
			awful.client.focus.byidx(-1)
		end,
		{ description = "focus previous by index", group = "client" }
	),
	awful.key({ modkey, }, "w", function() mymainmenu:show() end,
		{ description = "show main menu", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
		{ description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
		{ description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
		{ description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
		{ description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "client" }),
	awful.key({ modkey, }, "Tab",
		function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{ description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
		{ description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit,
		{ description = "quit awesome", group = "awesome" }),
	awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
		{ description = "increase master width factor", group = "layout" }),
	awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
		{ description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
		{ description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
		{ description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
		{ description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
		{ description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey, }, "space", function() awful.layout.inc(1) end,
		{ description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
		{ description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n",
		function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal(
					"request::activate", "key.unminimize", { raise = true }
				)
			end
		end,
		{ description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
		{ description = "run prompt", group = "launcher" }),

	awful.key({ modkey }, "x",
		function()
			awful.prompt.run {
				prompt       = "Run Lua code: ",
				textbox      = awful.screen.focused().mypromptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval"
			}
		end,
		{ description = "lua execute prompt", group = "awesome" }),
	-- Menubar
	awful.key({ modkey }, "p", function() menubar.show() end,
		{ description = "show the menubar", group = "launcher" })
)

clientkeys = gears.table.join(
	awful.key({ modkey, }, "f",
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{ description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey }, "c", function(c) c:kill() end,
		{ description = "close", group = "client" }),
	awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }),
	awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
		{ description = "move to master", group = "client" }),
	awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
		{ description = "move to screen", group = "client" }),
	awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
		{ description = "toggle keep on top", group = "client" }),
	awful.key({ modkey, }, "n",
		function(c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end,
		{ description = "minimize", group = "client" }),

	-- open rofi window

	awful.key({ modkey, "Control" }, "m",
		function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end,
		{ description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m",
		function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end,
		{ description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{ description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{ description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{ description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{ description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_color,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer" },

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},
		properties = { floating = true }
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = { type = { "normal", "dialog" }
		},
		properties = { titlebars_enabled = false }
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	{
		rule = { class = "Firefox" },
		properties = { screen = 1, tag = "2" }
	},
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup {
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout  = wibox.layout.fixed.horizontal
		},
		{ -- Middle
			{ -- Title
				align  = "center",
				widget = awful.titlebar.widget.titlewidget(c)
			},
			buttons = buttons,
			layout  = wibox.layout.flex.horizontal
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal()
		},
		layout = wibox.layout.align.horizontal
	}
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
awful.spawn.with_shell('setxkbmap -option caps:escape')
awful.spawn.with_shell('wal -R')
awful.spawn.with_shell('picom')

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)

client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Save the last used tag
awesome.connect_signal('exit', function(reason_restart)
	if not reason_restart then return end

	local file = io.open('/tmp/awesomewm-last-selected-tags', 'w+')

	for s in screen do
		file:write(s.selected_tag.index, '\n')
	end

	file:close()
end)

awesome.connect_signal('startup', function()
	local file = io.open('/tmp/awesomewm-last-selected-tags', 'r')
	if not file then return end

	local selected_tags = {}

	for line in file:lines() do
		table.insert(selected_tags, tonumber(line))
	end

	for s in screen do
		local i = selected_tags[s.index]
		local t = s.tags[i]
		t:view_only()
	end

	file:close()
end)
