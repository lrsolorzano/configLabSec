#!/bin/bash
# Simple script to install essential Kali Linux tools

# Update package lists
sudo apt update

# List of tools to install
tools=(
    nmap
    sqlmap
    metasploit-framework
    aircrack-ng
    burpsuite
    gobuster
    john
    wireshark
)

# Install each tool
for tool in "${tools[@]}"; do
    echo "Installing $tool..."
    sudo apt install -y $tool
done

echo "Installation of Kali Linux tools completed!"