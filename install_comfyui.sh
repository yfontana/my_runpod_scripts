#!/bin/bash
set -e

INSTALL_DIR="/opt/comfyui"

# Create directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating directory $INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

# Create virtual environment if it doesn't exist
if [ ! -d "venv_comfy" ]; then
    echo "Creating virtual environment"
    python -m venv venv_comfy
fi

# Activate virtual environment
source venv_comfy/bin/activate

# Clone repository if it doesn't exist
if [ ! -d "ComfyUI" ]; then
    echo "Cloning ComfyUI repository"
    git clone https://github.com/comfyanonymous/ComfyUI.git
else
    echo "ComfyUI already cloned, checking for updates"
    cd ComfyUI
    git pull
    cd ..
fi

# Install PyTorch if not already installed
if ! pip list | grep -q "torch"; then
    echo "Installing PyTorch"
    pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu129
fi

# Install requirements
cd ComfyUI/
echo "Installing/updating requirements"
pip install -r requirements.txt

echo "ComfyUI installation completed"