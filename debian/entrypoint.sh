#!/bin/bash

clear
echo "######################################################################"
echo "               IMAGE PROVIDED BY 0ADRI3N               "
echo "                  GitHub: https://github.com/0adri3n/linuxEverywh3re  "
echo "######################################################################"
echo ""

# Stop any existing X server
killall Xvfb 2>/dev/null

# Start SSH service
service ssh start

# Start virtual display
Xvfb :1 -screen 0 1024x768x16 +extension RANDR &
sleep 2

# Set DISPLAY and XAUTHORITY
export DISPLAY=:1
export XAUTHORITY=/root/.Xauthority
xauth generate :1 . trusted

# Start VNC server
x11vnc -display WAIT:1 -auth /root/.Xauthority -rfbauth /root/.vnc/passwd -forever &

# Start XFCE
startxfce4 &

# Keep the container running
tail -f /dev/null
