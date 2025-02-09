#!/bin/bash

clear
echo "######################################################################"
echo "               IMAGE PROVIDED BY 0ADRI3N               "
echo "                  GitHub: https://github.com/0adri3n/linuxEverywh3re  "
echo "######################################################################"
echo ""

# Start SSH service
service ssh start

# Start VNC server with XFCE
Xvfb :1 -screen 0 1024x768x16 &
export DISPLAY=:1
x11vnc -display :1 -rfbauth /root/.vnc/passwd -forever &
startxfce4 &

# Keep the container running
tail -f /dev/null
