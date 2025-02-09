#!/bin/bash
# Start SSH Server
service ssh start
# Start VNC Server
Xvfb :1 -screen 0 1024x768x16 &
x11vnc -display :1 -nopw -forever &
# Keep container alive
tail -f /dev/null
