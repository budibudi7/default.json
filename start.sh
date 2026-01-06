#!/bin/sh

MODEL_DIR="models/checkpoints"
MODEL_FILE="unholy-desire-mix-sinister-aesthetic-illustrious.safetensors"
MODEL_PATH="$MODEL_DIR/$MODEL_FILE"

echo "Ensuring model directory exists..."
mkdir -p "$MODEL_DIR"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading model from CivitAI..."

  # install curl if missing
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
