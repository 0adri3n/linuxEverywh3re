FROM debian:latest

# Update & Install SSH + VNC
RUN apt update && apt install -y \
    openssh-server \
    x11vnc \
    xvfb \
    && mkdir -p /var/run/sshd

# Define password
RUN echo 'root:toor' | chpasswd

# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Configure VNC
RUN mkdir -p ~/.vnc && echo "toor" | vncpasswd -f > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

# Entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22 5900
CMD ["/entrypoint.sh"]
