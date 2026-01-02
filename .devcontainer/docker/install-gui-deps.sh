#!/bin/bash
set -e

echo "Installing GUI dependencies for desktop environment..."

# Update package list
apt-get update

# Install GUI libraries required for desktop-lite feature
apt-get install -y --no-install-recommends \
    sudo \
    libglib2.0-dev \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libgtk-3-0 \
    libgbm1 \
    libasound2

# Clean up to reduce image size
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "GUI dependencies installed successfully."
