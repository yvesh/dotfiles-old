#!/bin/bash
xrandr -o left
# xinput set-prop 9 'Evdev Axis Inversion' 1, 0
#xinput set-prop 9 'Evdev Axis Swap' 1
#xinput set-prop 16 'Evdev Axis Inversion' 1, 0
#xinput set-prop 16 'Evdev Axis Swap' 
xinput set-prop 9 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
xinput set-prop 16 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
xinput --disable 13
