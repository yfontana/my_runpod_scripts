#!/bin/bash

# Base directory
BASE_DIR="/workspace/comfyui/models"

# VAE
VAE_DIR="${BASE_DIR}/vae"
mkdir -p "$VAE_DIR"
cd "$VAE_DIR"

VAE_FILE="ae.safetensors"
if [ ! -f "$VAE_FILE" ]; then
    echo "Downloading $VAE_FILE..."
    wget "https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/$VAE_FILE"
else
    echo "$VAE_FILE already exists, skipping download."
fi

# Text encoder
TEXT_ENCODERS_DIR="${BASE_DIR}/text_encoders"
mkdir -p "$TEXT_ENCODERS_DIR"
cd "$TEXT_ENCODERS_DIR"

TEXT_ENCODER_FILE="t5xxl_fp16.safetensors"
if [ ! -f "$TEXT_ENCODER_FILE" ]; then
    echo "Downloading $TEXT_ENCODER_FILE..."
    wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/$TEXT_ENCODER_FILE"
else
    echo "$TEXT_ENCODER_FILE already exists, skipping download."
fi

# Diffusion model
DIFFUSION_DIR="${BASE_DIR}/diffusion_models"
mkdir -p "$DIFFUSION_DIR"
cd "$DIFFUSION_DIR"

DIFF_MODEL="chroma-unlocked-v50.safetensors"
if [ ! -f "$DIFF_MODEL" ]; then
    echo "Downloading $DIFF_MODEL..."
    wget "https://huggingface.co/lodestones/Chroma/resolve/main/$DIFF_MODEL"
else
    echo "$DIFF_MODEL already exists, skipping download."
fi

echo "Installation complete!"