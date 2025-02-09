#!/bin/bash
# Démarrer le serveur SSH
service ssh start

# Démarrer le serveur VNC avec XFCE
Xvfb :1 -screen 0 1024x768x16 &
export DISPLAY=:1
x11vnc -display :1 -rfbauth /root/.vnc/passwd -forever &
startxfce4 &

# Garder le conteneur actif
tail -f /dev/null
