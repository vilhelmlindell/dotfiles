#!/bin/sh

ICON="󰃠 "
BRIGHTNESS=$(brillo -G | sed 's/...$//')
echo " $ICON $BRIGHTNESS% "
