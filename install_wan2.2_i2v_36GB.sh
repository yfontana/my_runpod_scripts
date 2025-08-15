#!/bin/bash

# Base directory
BASE_DIR="/workspace/comfyui/models"

# VAE
VAE_DIR="${BASE_DIR}/vae"
mkdir -p "$VAE_DIR"
cd "$VAE_DIR"

VAE_FILE="wan_2.1_vae.safetensors"
if [ ! -f "$VAE_FILE" ]; then
    echo "Downloading $VAE_FILE..."
    wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/$VAE_FILE"
else
    echo "$VAE_FILE already exists, skipping download."
fi

# Text encoder
TEXT_ENCODERS_DIR="${BASE_DIR}/text_encoders"
mkdir -p "$TEXT_ENCODERS_DIR"
cd "$TEXT_ENCODERS_DIR"

TEXT_ENCODER_FILE="umt5_xxl_fp8_e4m3fn_scaled.safetensors"
if [ ! -f "$TEXT_ENCODER_FILE" ]; then
    echo "Downloading $TEXT_ENCODER_FILE..."
    wget "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/$TEXT_ENCODER_FILE"
else
    echo "$TEXT_ENCODER_FILE already exists, skipping download."
fi

# Diffusion model
DIFFUSION_DIR="${BASE_DIR}/diffusion_models"
mkdir -p "$DIFFUSION_DIR"
cd "$DIFFUSION_DIR"

DIFF_MODEL="wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
if [ ! -f "$DIFF_MODEL" ]; then
    echo "Downloading $DIFF_MODEL..."
    wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/$DIFF_MODEL"
else
    echo "$DIFF_MODEL already exists, skipping download."
fi

DIFF_MODEL="wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"
if [ ! -f "$DIFF_MODEL" ]; then
    echo "Downloading $DIFF_MODEL..."
    wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/$DIFF_MODEL"
else
    echo "$DIFF_MODEL already exists, skipping download."
fi

# Lora
LORA_DIR="${BASE_DIR}/loras"
mkdir -p "$LORA_DIR"
cd "$LORA_DIR"

LORA_MODEL="wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"
if [ ! -f "$LORA_MODEL" ]; then
    echo "Downloading $LORA_MODEL..."
    wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/$LORA_MODEL"
else
    echo "$LORA_MODEL already exists, skipping download."
fi

LORA_MODEL="wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors"
if [ ! -f "$LORA_MODEL" ]; then
    echo "Downloading $LORA_MODEL..."
    wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/$LORA_MODEL"
else
    echo "$LORA_MODEL already exists, skipping download."
fi

echo "Installation complete!"