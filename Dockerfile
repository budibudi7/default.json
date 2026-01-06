# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-image-saver@1.20.0 --mode remote

# unknown_registry nodes could not be resolved to a known package or GitHub repo, skipping
# Could not resolve unknown_registry node 'MarkdownNote' - no aux_id provided
# Could not resolve unknown_registry node 'MarkdownNote' - no aux_id provided
# Could not resolve unknown_registry node 'MarkdownNote' - no aux_id provided
# Could not resolve unknown_registry node 'MarkdownNote' - no aux_id provided

# download models into comfyui
RUN comfy model download --url https://huggingface.co/John6666/unholy-desire-mix-sinister-aesthetic-illustrious-v20-sdxl/resolve/main/vae/diffusion_pytorch_model.safetensors --relative-path models/checkpoints --filename unholy-desire-mix-sinister-aesthetic-illustrious.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
