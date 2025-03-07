#!/bin/bash
# Install Docker if not already installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    sudo apt update
    sudo apt install -y docker.io
else
    echo "Docker is already installed."
fi
