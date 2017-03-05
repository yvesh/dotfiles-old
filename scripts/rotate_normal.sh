#!/bin/bash
xrandr -o normal

xinput set-prop 9 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
xinput set-prop 16 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1 

xinput --enable 13
