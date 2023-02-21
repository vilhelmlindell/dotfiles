local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi

local volume_levels = {
    "󰕿",
    "󰖀",
    "󰕾",
}

local volume_container = wibox.container

local volume_widget = wibox.widget {
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

volume_widget:connect_signal("button::press", function()
    awful.spawn("pavucontrol")
end)

local update_volume_widget = function(volume, is_muted)
   if is_muted then
      volume_widget.text = "󰝟 "
      return end

   volume_widget.text = volume .. "%"

   if volume == 0 then
      volume_widget.text = volume_widget.text .. "󰖁"
      return end

   volume_widget.text = volume_widget.text .. volume_levels[math.ceil(volume / 34)]
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

volume_container = {
  {
    {
      {
        widget = volume_widget,
      },
      left   = 12,
      right  = 10,
      top    = 0,
      bottom = 0,
      widget = wibox.container.margin
    },
    shape  = gears.shape.rounded_bar,
    fg     = "#f51ba8",
    bg     = "#178e2e",
    widget = wibox.container.background
  },
  spacing = 5,
  layout  = wibox.layout.fixed.horizontal,
}

return volume_container
