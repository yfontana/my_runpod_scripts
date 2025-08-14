#!/bin/bash

# Base directory
BASE_DIR="/opt/comfyui/ComfyUI/models"

# VAE
VAE_DIR="${BASE_DIR}/vae"
mkdir -p "$VAE_DIR"
cd "$VAE_DIR"

VAE_FILE="ae.safetensors"
if [ ! -f "$VAE_FILE" ]; then
    echo "Downloading $VAE_FILE..."
    wget https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors
else
    echo "$VAE_FILE already exists, skipping download."
fi

# Text encoders
TEXT_ENCODERS_DIR="${BASE_DIR}/text_encoders"
mkdir -p "$TEXT_ENCODERS_DIR"
cd "$TEXT_ENCODERS_DIR"

TEXT_ENC_FILES=("clip_l.safetensors" "t5xxl_fp8_e4m3fn_scaled.safetensors")
for file in "${TEXT_ENC_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Downloading $file..."
        wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/$file"
    else
        echo "$file already exists, skipping download."
    fi
done

# Diffusion models
DIFFUSION_DIR="${BASE_DIR}/diffusion_models"
mkdir -p "$DIFFUSION_DIR"
cd "$DIFFUSION_DIR"

DIFF_MODEL="flux1-dev-kontext_fp8_scaled.safetensors"
if [ ! -f "$DIFF_MODEL" ]; then
    echo "Downloading $DIFF_MODEL..."
    wget "https://huggingface.co/Comfy-Org/flux1-kontext-dev_ComfyUI/resolve/main/split_files/diffusion_models/$DIFF_MODEL"
else
    echo "$DIFF_MODEL already exists, skipping download."
fi

echo "Installation complete!"