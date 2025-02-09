#!/bin/bash

# Update package list
echo "Updating package list..."
apt update -y || true

# Upgrade all installed packages
echo "Upgrading packages..."
apt upgrade -y || true

# Install common Kali Linux tools
echo "Installing basic Kali Linux tools..."

apt install -y \
    nmap \
    net-tools \
    curl \
    wget \
    git \
    vim \
    python3-pip \
    python3-dev \
    metasploit-framework \
    hydra \
    aircrack-ng \
    john \
    burpsuite \
    netcat-traditional \
    gobuster \
    dnsutils \
    nikto \
    enum4linux \
    smbclient \
    wireshark \
    netcat-openbsd \
    zsh \
    tcpdump \
    unzip \
    jq \
    libpcap-dev || true

# Install additional tools (if needed)
echo "Installing additional tools (optional)..."
apt install -y \
    docker.io \
    snapd \
    golang \
    ruby || true

# Clean up unnecessary files
echo "Cleaning up..."
apt autoremove -y || true
apt clean || true

# Display installation completion message
echo "Installation complete!"
