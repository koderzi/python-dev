#!/bin/bash
set -e

echo "Installing GUI dependencies for desktop environment..."

apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    libglib2.0-dev \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libgtk-3-0 \
    libgbm1 \
    libasound2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

echo "GUI dependencies installed successfully."
