#!/bin/sh
set -e

MODEL_PATH="models/checkpoints/unholy-desire-mix-sinister-aesthetic-illustrious.safetensors"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading model from CivitAI..."

  apt-get update
  apt-get install -y curl

  curl -L \
  "https://civitai.com/api/download/models/2403075?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=6c763551a51643ee44beca122679f67a" \
  -o "$MODEL_PATH"
fi

echo "Starting ComfyUI..."
exec python main.py
