FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes
RUN comfy node install --exit-on-fail comfyui-image-saver@1.20.0 --mode remote

# copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
