#!/bin/bash
cd Titanfall2

# Setup environment
export WINEARCH=win64
export WINEPREFIX=/Wine
export LIBGL_ALWAYS_SOFTWARE=1
export __GLX_VENDOR_LIBRARY_NAME=mesa
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json
export WINEDEBUG=-all

# Ensure DXVK is installed
winetricks dxvk || true

# Download latest Northstar release if not found
if [ ! -f "NorthstarLauncher.exe" ]; then
  wget -O northstar.zip `curl -s https://api.github.com/repos/R2Northstar/Northstar/releases/latest | jq -r '.assets[0].browser_download_url'`
  unzip northstar.zip && rm northstar.zip
fi

# Run Northstar
xvfb-run bash -c "wine NorthstarLauncher.exe -dedicated -multiple | cat"
