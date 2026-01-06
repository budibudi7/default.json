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
RUN comfy model download --url https://civitai.com/api/download/models/2403075?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=6c763551a51643ee44beca122679f67a --relative-path models/checkpoints --filename unholy-desire-mix-sinister-aesthetic-illustrious.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
