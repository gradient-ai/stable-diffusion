FROM paperspace/gradient-base:pt112-tf29-jax0314-py39-20220803
RUN pip3 install --upgrade pip
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

WORKDIR /stable-diffusion-webui

## pip installs
RUN pip install transformers scipy ftfy ipywidgets msgpack rich einops omegaconf pytorch_lightning basicsr optax facexlib realesrgan kornia imwatermark invisible-watermark piexif fonts font-roboto gradio
RUN pip install git+https://github.com/crowsonkb/k-diffusion.git
RUN pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
RUN pip install git+https://github.com/openai/CLIP.git
RUN pip install diffusers

RUN pip install -r requirements.txt
RUN ls 
RUN mkdir repositories
RUN git clone https://github.com/CompVis/stable-diffusion /repositories/stable-diffusion
RUN git clone https://github.com/TencentARC/GFPGAN.git /repositories/GFPGAN

EXPOSE 7860

CMD python launch.py --autolaunch --listen --enable-insecure-extension-access --api --port 7860