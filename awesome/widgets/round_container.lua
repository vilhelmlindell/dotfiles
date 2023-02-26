local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

function round_container(widget)
    return {
        {
            {
                widget = widget,
            },
            shape  = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 15)
            end,
            fg     = beautiful.black,
            bg     = beautiful.blue,
            widget = wibox.container.background
        },
        left   = 5,
        right  = 5,
        top    = 8,
        bottom = 8,
        widget = wibox.container.margin
    }
end
