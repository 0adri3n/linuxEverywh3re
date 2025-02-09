FROM debian:latest

# Mise à jour et installation SSH/VNC + dépendances
RUN apt update && apt install -y \
    openssh-server \
    x11vnc \
    xvfb \
    dbus-x11 \
    && mkdir -p /var/run/sshd

# Installer XFCE et un terminal
RUN apt update && apt install -y \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    xfonts-base

# Définir un mot de passe root
RUN echo 'root:toor' | chpasswd

# Configurer SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Configurer VNC (alternative sans `vncpasswd`)
RUN mkdir -p /root/.vnc \
    && yes "toor" | x11vnc -storepasswd /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd

# Configurer le fichier xstartup pour VNC
RUN mkdir -p ~/.vnc \
    && echo "#!/bin/sh" > ~/.vnc/xstartup \
    && echo "export DISPLAY=:1" >> ~/.vnc/xstartup \
    && echo "startxfce4 &" >> ~/.vnc/xstartup \
    && chmod +x ~/.vnc/xstartup

# Script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22 5900
CMD ["/entrypoint.sh"]
