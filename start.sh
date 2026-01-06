#!/bin/sh

set -e

echo "Locating ComfyUI directory..."

# cari main.py (root ComfyUI)
COMFY_DIR=$(find / -type f -name "main.py" 2>/dev/null | head -n 1 | xargs dirname)

if [ -z "$COMFY_DIR" ]; then
  echo "ERROR: ComfyUI main.py not found!"
  exit 1
fi

echo "Found ComfyUI at: $COMFY_DIR"
cd "$COMFY_DIR"

MODEL_DIR="models/checkpoints"
MODEL_FILE="unholy-desire-mix-sinister-aesthetic-illustrious.safetensors"
MODEL_PATH="$MODEL_DIR/$MODEL_FILE"

echo "Ensuring model directory exists..."
mkdir -p "$MODEL_DIR"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading model from CivitAI..."

  if ! command -v curl >/dev/null 2>&1; then
    apt-get update && apt-get install -y curl
  fi

  curl -L \
  "https://civitai.com/api/download/models/2403075?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=6c763551a51643ee44beca122679f67a" \
  -o "$MODEL_PATH"

  echo "Model download finished."
else
  echo "Model already exists."
fi

echo "Starting ComfyUI..."
exec python main.py
