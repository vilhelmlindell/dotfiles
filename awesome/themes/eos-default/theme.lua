--[[

     EndeavourOS Awesome WM theme
     Created by: S4NDM4N

--]]
--{{{ Required libraries.
local gears                                     = require("gears")
local lain                                      = require("lain")
local awful                                     = require("awful")
local wibox                                     = require("wibox")

local math, string, os                          = math, string, os
local myTable                                   = awful.util.table or gears.table -- 4.{0,1} compatibility

-- }}}

-- {{{ Initiating theme variable.
local theme                                     = {}
-- }}}

-- {{{ Assigning values to theme.
-- Theme config folder
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/eos-default"

-- Theme wallpaper.
--theme.wallpaper                                 = "/usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png"
theme.wallpaper                                 = os.getenv("HOME") ..
    "/.config/awesome/themes/wallpapers/evening-sky.png"

-- Theme fonts.
theme.font                                      = "JetBrains Mono 14"
theme.large_font                                = "JetBrains Mono 16"
theme.taglist_font                              = "JetBrains Mono 14"

theme.rosewater                                 = "#f5e0dc"
theme.flamingo                                  = "#f2cdcd"
theme.pink                                      = "#f5c2e7"
theme.mauve                                     = "#cba6f7"
theme.red                                       = "#f38ba8"
theme.maroon                                    = "#eba0ac"
theme.peach                                     = "#fab387"
theme.yellow                                    = "#f9e2af"
theme.green                                     = "#a6e3a1"
theme.teal                                      = "#94e2d5"
theme.sky                                       = "#89dceb"
theme.sapphire                                  = "#74c7ec"
theme.blue                                      = "#89b4fa"
theme.lavender                                  = "#b4befe"
theme.text                                      = "#cdd6f4"
theme.subtext1                                  = "#bac2de"
theme.subtext0                                  = "#a6adc8"
theme.overlay2                                  = "#9399b2"
theme.overlay1                                  = "#7f849c"
theme.overlay0                                  = "#6c7086"
theme.surface2                                  = "#585b70"
theme.surface1                                  = "#45475a"
theme.surface0                                  = "#313244"
theme.base                                      = "#1e1e2e"
theme.mantle                                    = "#181825"
theme.crust                                     = "#11111b"

theme.colors                                    = { theme.rosewater,
    theme.flamingo,
    theme.pink, theme.mauve,
    theme.red,
    theme.maroon,
    theme.peach,
    theme.yellow,
    theme.green,
    theme.teal,
    theme.sky, theme.sapphire, theme.blue, theme.lavender }

theme.bg_normal                                 = theme.base
theme.bg_focus                                  = theme.surface0
theme.bg_urgent                                 = theme.peach
theme.bg_minimize                               = theme.yellow
theme.bg_systray                                = theme.blue

theme.fg_normal                                 = theme.crust
theme.fg_focus                                  = theme.surface0
theme.fg_urgent                                 = theme.peach
theme.fg_minimize                               = theme.yellow

theme.border_normal                             = theme.base
theme.border_focus                              = theme.blue
theme.border_marked                             = theme.mauve

theme.taglist_bg_focus                          = theme.blue

-- Menu and border widths.
theme.border_width                              = 3
theme.menu_border_width                         = 0
theme.menu_height                               = 25
theme.menu_width                                = 260

-- Icons for the theme. theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"
theme.widget_weather                            = theme.dir .. "/icons/dish.png"

-- Tasklist and gap width.
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 5

-- Titalebar icons
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
-- }}}

local markup                                    = lain.util.markup
local separators                                = lain.util.separators


-- Textclock
local clock = awful.widget.watch(
    "date +'󰃭 %a %d %b   %R '", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = theme.font,
        fg   = theme.text,
        bg   = theme.bg_normal
    }
})



-- Taskwarrior
--[[
local task = wibox.widget.imagebox(theme.widget_task)
lain.widget.contrib.task.attach(task, {
     do not colorize output
    show_cmd = "task | sed -r 's/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g'"
})
task:buttons(gears.table.join(awful.button({}, 1, lain.widget.contrib.task.prompt)))
--]]
-- Mail IMAP check
--local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[ commented because it needs to be set before use
mailicon:buttons(myTable.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_text(" " .. mailcount .. " ")
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]
-- ALSA volume
theme.volume = lain.widget.alsabar({
    --togglechannel = "IEC958,3",
    notification_preset = { font = theme.font, fg = theme.fg_normal },
})

-- MPD
--local musicplr = "urxvt -title Music -g 130x34-320+16 -e ncmpcpp"
--local mpdicon = wibox.widget.imagebox(theme.widget_music)
--mpdicon:buttons(myTable.join(
--    awful.button({ modkey }, 1, function() awful.spawn.with_shell(musicplr) end),
--    --[[awful.button({ }, 1, function ()
--        awful.spawn.with_shell("mpc prev")
--        theme.mpd.update()
--    end),
--    --]]
--    awful.button({}, 2, function()
--        awful.spawn.with_shell("mpc toggle")
--        theme.mpd.update()
--    end),
--    awful.button({ modkey }, 3, function() awful.spawn.with_shell("pkill ncmpcpp") end),
--    awful.button({}, 3, function()
--        awful.spawn.with_shell("mpc stop")
--        theme.mpd.update()
--    end)))
--theme.mpd = lain.widget.mpd({
--    settings = function()
--        if mpd_now.state == "play" then
--            artist = " " .. mpd_now.artist .. " "
--            title  = mpd_now.title .. " "
--            mpdicon:set_image(theme.widget_music_on)
--            widget:set_markup(markup.font(theme.font, markup("#FFFFFF", artist) .. " " .. title))
--        elseif mpd_now.state == "pause" then
--            widget:set_markup(markup.font(theme.font, " mpd paused "))
--            mpdicon:set_image(theme.widget_music_pause)
--        else
--            widget:set_text("")
--            mpdicon:set_image(theme.widget_music)
--        end
--    end
--})

-- MEM
--local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.large_font, " 󰍛 ") .. mem_now.used .. "MB ")
    end
})

-- CPU
--local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.large_font, " 󰻠 ") .. cpu_now.usage .. "% ")
    end
})

--[[ Coretemp (lm_sensors, per core)
local tempwidget = awful.widget.watch({awful.util.shell, '-c', 'sensors | grep Core'}, 30,
function(widget, stdout)
    local temps = ""
    for line in stdout:gmatch("[^\r\n]+") do
        temps = temps .. line:match("+(%d+).*°C")  .. "° " -- in Celsius
    end
    widget:set_markup(markup.font(theme.font, " " .. temps))
end)
--]]
-- Coretemp (lain, average)
--[[
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})
--]]
--local tempicon = wibox.widget.imagebox(theme.widget_temp)

--[[ Weather
https://openweathermap.org/
Type in the name of your city
Copy/paste the city code in the URL to this file in city_id
--]]
--[[
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 2803138, -- placeholder (Belgium)
    notification_preset = { font = "Mononoki Nerd Font 11", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#ffffff", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", descr .. " @ " .. units .. "°C "))
    end
})
--]]
--[[ / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Noto Sans Mono Medium 10" },
    settings = function()
        local fsp = string.format(" %3.2f %s ", fs_now["/"].free, fs_now["/"].units)
        widget:set_markup(markup.font(theme.font, fsp))
    end
})
--]]
-- Battery
local bat = lain.widget.bat({
    settings = function()
        if bat_now.ac_status == "N/A" then
            widget:set_markup(markup.font(theme.font, " 󰚥 AC "))
            return
        else
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        end
    end
})

-- ALSA volume
--local volicon = wibox.widget.imagebox(theme.widget_vol)

local volume_icons = {
    "󰕿",
    "󰖀",
    "󰕾"
}

theme.volume = lain.widget.alsa({
    settings = function()
        if theme.volume and volume_now.level then -- Stops passing nil values. If not an errors is given when unlocked.
            local volume_icon = ""

            volume_icon = volume_icons[1 + math.floor(tonumber(volume_now.level) / 34)]

            if volume_now.status == "off" then
                volume_icon = "󰝟"
            end

            widget:set_markup(markup.font(theme.font, " " .. volume_icon .. volume_now.level .. "% "))
        end
    end
})

-- Net
--local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "  " .. net_now.received .. " ↓↑ " ..
        net_now.sent .. " "))
    end
})

-- Separators
local arrow = separators.arrow_left

function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height / 2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width  = width + 2 * arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth, 0)
    cr:line_to(offset + width, 0)
    cr:line_to(offset + width - arrow_depth, height / 2)
    cr:line_to(offset + width, height)
    cr:line_to(offset + arrow_depth, height)
    cr:line_to(offset, height / 2)

    cr:close_path()
end

local function pl(widget, bgcolor, padding)
    return wibox.container.background(wibox.container.margin(widget, 16, 16), bgcolor, theme.powerline_rl)
end

local color_index = 4

local function round_container(widget)
    color_index = color_index + 1
    return {
        {
            widget,
            shape  = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 15)
            end,
            bg     = theme.colors[color_index % #theme.colors],
            widget = wibox.container.background
        },
        left   = 5,
        right  = 5,
        top    = 9,
        bottom = 9,
        widget = wibox.container.margin
    }
end

local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

function theme.at_screen_connect(s)
    -- Quake application
    -- s.quake = lain.util.quake({ app = awful.util.terminal })
    s.quake = lain.util.quake({ app = "termite", height = 0.50, argname = "--name %s" })



    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- All tags open with layout 1
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(myTable.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc( -1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc( -1) end)))
    -- Create a taglist widget
    --s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
    s.mytaglist = require("themes.eos-default.widgets.taglist")(s)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    --s.mywibox = awful.wibar({
    --    position = "top",
    --    screen = s,
    --    height = s.workarea.height / 30,
    --    bg = theme.bg_normal,
    --    fg = theme.fg_normal
    --})


    s.padding = {
        top = 60
    }

    s.mywibox = wibox
        {
            screen = s,
            visible = true,
            ontop = true,
            width = s.geometry.width - 20,
            align = "center",
            y = 10,
            x = 10,
            height = 50,
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 20)
            end,
        }

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr
            round_container(s.mytaglist),
        },
        --s.mytasklist, -- Middle widget
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --[[ using shapes
            pl(wibox.widget { mpdicon, theme.mpd.widget, layout = wibox.layout.align.horizontal }, "#343434"),
            pl(task, "#343434"),
            --pl(wibox.widget { mailicon, mail and mail.widget, layout = wibox.layout.align.horizontal }, "#343434"),
            pl(wibox.widget { memicon, mem.widget, layout = wibox.layout.align.horizontal }, "#777E76"),
            pl(wibox.widget { cpuicon, cpu.widget, layout = wibox.layout.align.horizontal }, "#4B696D"),
            pl(wibox.widget { tempicon, temp.widget, layout = wibox.layout.align.horizontal }, "#4B3B51"),
            pl(wibox.widget { fsicon, theme.fs.widget, layout = wibox.layout.align.horizontal }, "#CB755B"),
            pl(wibox.widget { baticon, bat.widget, layout = wibox.layout.align.horizontal }, "#8DAA9A"),
            pl(wibox.widget { neticon, net.widget, layout = wibox.layout.align.horizontal }, "#C0C0A2"),
            pl(binclock.widget, "#777E76"),
            --]]
            -- using separators
            --arrow(theme.bg_normal, "#343434"),
            -- wibox.container.background(wibox.container.margin(wibox.widget { mailicon, mail and mail.widget, layout = wibox.layout.align.horizontal }, 4, 7), "#343434"),
            --arrow("alpha", "#7E7EFF"),
            --wibox.container.background(wibox.container.margin(wibox.widget { mpdicon, theme.mpd.widget, layout = wibox.layout.align.horizontal }, 3, 6), "#7E7EFF"),
            round_container(wibox.widget { mem.widget, layout = wibox.layout.align.horizontal }),
            round_container(wibox.widget { cpu.widget, layout = wibox.layout.align.horizontal }),
            battery_widget,
            --arrow("#7E3EBE", "#7E7EFF"),
            --wibox.container.background(wibox.container.margin(wibox.widget { tempicon, temp.widget, layout = wibox.layout.align.horizontal }, 4, 4), "#7E7EFF"),
            --arrow("#7E7EFF", "#7E3EBE"),
            --wibox.container.background(wibox.container.margin(wibox.widget { weathericon, theme.weather.widget, layout = wibox.layout.align.horizontal }, 3, 3), "#7E3EBE"),
            round_container(wibox.widget { bat.widget, layout = wibox.layout.align.horizontal }),
            round_container(wibox.widget { theme.volume.widget, layout = wibox.layout.align.horizontal }),
            round_container(wibox.widget { nil, net.widget, layout = wibox.layout.align.horizontal }),
            round_container(clock),
            --s.mylayoutbox,
        },
    }
    -- Creating the bottom wibox.
    --s.mybottomwibox = awful.wibar({
    --    position = "bottom",
    --    screen = s,
    --    border_width = 0,
    --    height = 20,
    --    bg = theme.bg_normal,
    --    fg = theme.fg_normal
    --})

    ---- Adding widgets to the bottom wibox.
    --s.mybottomwibox:setup {
    --    layout = wibox.layout.align.horizontal,
    --    { -- Left widgets
    --        layout = wibox.layout.fixed.horizontal,
    --    },
    --    s.mytasklist, -- Middle widget
    --    { -- Right widgets
    --        layout = wibox.layout.fixed.horizontal,
    --        s.mylayoutbox,
    --    },
    --}
end

return theme
