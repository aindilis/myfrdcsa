#!/bin/sh


# xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode VGA-1 1920x1080_60.00
xrandr --auto --output VGA-1  --mode 1920x1080_60.00
xrandr --output VGA-1 --auto --pos 0x0 --primary --output DVI-I-1 --auto --pos 1920x0

# xrandr --newmode "1920x1080_75.00"  220.75  1920 2064 2264 2608  1080 1083 1088 1130 -hsync +vsync
# xrandr --addmode VGA-1 1920x1080_75.00
# xrandr --auto --output VGA-1  --mode 1920x1080_75.00

# xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
# xrandr --addmode VGA-1 1680x1050_60.00
# xrandr --auto --output VGA-1  --mode 1680x1050_60.00

# xrandr --newmode "1440x900_60.00"  106.50  1440 1528 1672 1904  900 903 909 934 -hsync +vsync
# xrandr --addmode VGA-1 1440x900_60.00
# xrandr --auto --output VGA-1  --mode 1440x900_60.00

# xrandr --newmode "1280x720_60.00"   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync
# xrandr --addmode VGA-1 1280x720_60.00
# xrandr --auto --output VGA-1  --mode 1280x720_60.00



