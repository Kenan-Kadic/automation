#!/bin/bash

# Temporary directory to store the downloaded image
temp_dir="/tmp/apod"

# Function to download the Astronomy Picture of the Day
download_apod() {
    local apod_url="https://apod.nasa.gov/apod/astropix.html"
    local image_url=$(wget -qO- "$apod_url" | grep -o 'https://apod.nasa.gov/apod/.*jpg' | head -n1)
    wget -q -P "$temp_dir" "$image_url"
}

# Function to set the desktop background
set_background() {
    local image_path=$(ls "$temp_dir"/*.jpg)
    gsettings set org.gnome.desktop.background picture-uri "file://$image_path"
}

# Create temporary directory if it doesn't exist
mkdir -p "$temp_dir"

# Download the Astronomy Picture of the Day
download_apod

# Set the desktop background
set_background

# Clean up temporary directory
rm -rf "$temp_dir"
