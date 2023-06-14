#!/bin/bash

#This command creates a new mode called "1366x768_60.00" with adjusted timing parameters 
#suitable for a resolution of 1366x768 at 60 Hz. The values such as pixel clock frequency 
#and horizontal/vertical timing are adjusted accordingly.
xrandr --newmode 1366x768_60.00  85.86  1366 1440 1576 1784  768 771 781 798 -hsync +vsync

#This command adds the newly created mode "1366x768_60.00" to the specified output (HDMI-A-0).
xrandr --addmode HDMI-A-0 1366x768_60.00

#This command sets the specified output (HDMI-A-0) to use the mode "1366x768_60.00", 
#effectively changing the screen resolution to 1366x768 at 60 Hz.
xrandr --output HDMI-A-0 --mode 1366x768_60.00


