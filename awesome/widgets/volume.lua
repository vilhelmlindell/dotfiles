local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
require('widgets.round_container')

local volume_levels = {
    "󰕿",
    "󰖀",
    "󰕾",
}

local volume_widget = wibox.widget {
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

volume_widget:connect_signal("button::press", function()
    awful.spawn("pavucontrol")
end)


local get_icon = function(volume, is_muted)
    if is_muted then return "󰝟 " end
    if volume == 0 then return "󰖁" end
    return volume_levels[math.ceil(volume / 34)]
end

local update_volume_widget = function(volume, is_muted)
    volume_widget.text = get_icon(volume, is_muted)
    if not is_muted then
        volume_widget.text = volume_widget.text .. " " .. volume .. "%"
    end
    volume_widget.text = "  " .. volume_widget.text .. "  "
end

--awful.widget.watch([[awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master)]], 1, function(self, stdout)
--    update_volume_widget_widget('helldwakdjwal')
--end)
awful.widget.watch("amixer get Master", 0.1, function(self, stdout)
    local volume = tonumber(string.match(stdout, '(%d?%d?%d)%%'))
    if string.find(stdout, "off") then
        update_volume_widget(volume, true)
    else
        update_volume_widget(volume, false)
    end
end)

return volume_widget
