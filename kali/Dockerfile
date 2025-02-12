FROM kalilinux/kali-rolling

# Update & Install SSH + VNC + dependencies
RUN apt update && apt install -y \
    git \
    openssh-server \
    x11vnc \
    xvfb \
    dbus-x11 \
    && mkdir -p /var/run/sshd

# Install XFCE + Terminal
RUN apt update && apt install -y \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    xfonts-base

# Set root password
RUN echo 'root:toor' | chpasswd

# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Configure VNC (alternative without `vncpasswd`)
RUN mkdir -p /root/.vnc \
    && yes "toor" | x11vnc -storepasswd /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd

# Configure xstartup file for VNC
RUN mkdir -p ~/.vnc \
    && echo "#!/bin/sh" > ~/.vnc/xstartup \
    && echo "export DISPLAY=:1" >> ~/.vnc/xstartup \
    && echo "startxfce4 &" >> ~/.vnc/xstartup \
    && chmod +x ~/.vnc/xstartup

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy install_tools script
COPY install_tools.sh /install_tools.sh
RUN chmod +x /install_tools.sh

# Install additional tools by running install_tools.sh
RUN /install_tools.sh

EXPOSE 22 5900
CMD ["/entrypoint.sh"]
