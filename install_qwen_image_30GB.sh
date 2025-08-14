#!/bin/bash

# Base directory
BASE_DIR="/opt/comfyui/ComfyUI/models"

# VAE
VAE_DIR="${BASE_DIR}/vae"
mkdir -p "$VAE_DIR"
cd "$VAE_DIR"

VAE_FILE="qwen_image_vae.safetensors"
if [ ! -f "$VAE_FILE" ]; then
    echo "Downloading $VAE_FILE..."
    wget https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
else
    echo "$VAE_FILE already exists, skipping download."
fi

# Text encoder
TEXT_ENCODERS_DIR="${BASE_DIR}/text_encoders"
mkdir -p "$TEXT_ENCODERS_DIR"
cd "$TEXT_ENCODERS_DIR"

TEXT_ENCODER_FILE="qwen_2.5_vl_7b_fp8_scaled.safetensors"
if [ ! -f "$TEXT_ENCODER_FILE" ]; then
    echo "Downloading $TEXT_ENCODER_FILE..."
    wget https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
else
    echo "$TEXT_ENCODER_FILE already exists, skipping download."
fi

# Diffusion model
DIFFUSION_DIR="${BASE_DIR}/diffusion_models"
mkdir -p "$DIFFUSION_DIR"
cd "$DIFFUSION_DIR"

DIFF_MODEL="qwen_image_fp8_e4m3fn.safetensors"
if [ ! -f "$DIFF_MODEL" ]; then
    echo "Downloading $DIFF_MODEL..."
    wget "https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/$DIFF_MODEL"
else
    echo "$DIFF_MODEL already exists, skipping download."
fi

# Lora
LORA_DIR="${BASE_DIR}/loras"
mkdir -p "$LORA_DIR"
cd "$LORA_DIR"

LORA_MODEL="Qwen-Image-Lightning-8steps-V1.0.safetensors"
if [ ! -f "$LORA_MODEL" ]; then
    echo "Downloading $LORA_MODEL..."
    wget "https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/$LORA_MODEL"
else
    echo "$LORA_MODEL already exists, skipping download."
fi

echo "Installation complete!"