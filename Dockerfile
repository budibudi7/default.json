FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes
RUN comfy node install --exit-on-fail comfyui-image-saver@1.20.0 --mode remote

# civitai token via build arg / env
ARG CIVITAI_TOKEN
ENV CIVITAI_TOKEN=${CIVITAI_TOKEN}

# ensure checkpoint directory exists + download model
RUN mkdir -p models/checkpoints && \
    curl -L \
    "https://civitai.com/api/download/models/2403075?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=${CIVITAI_TOKEN}" \
    -o models/checkpoints/unholy-desire-mix-sinister-aesthetic-illustrious.safetensors
