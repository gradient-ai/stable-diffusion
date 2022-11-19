FROM paperspace/gradient-base:pt112-tf29-jax0314-py39-20220803

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

WORKDIR /stable-diffusion-webui

RUN git clone https://github.com/TencentARC/GFPGAN.git

## pip installs
RUN pip install transformers scipy ftfy ipywidgets msgpack rich einops omegaconf pytorch_lightning basicsr optax facexlib realesrgan kornia imwatermark
RUN pip install git+https://github.com/crowsonkb/k-diffusion.git
RUN pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
RUN pip install git+https://github.com/openai/CLIP.git
RUN pip install diffusers
RUN apt-get update
RUN apt-get install aria2 -y
RUN pip install invisible-watermark piexif fonts font-roboto gradio
RUN pip install -r requirements.txt
RUN ls 
RUN mkdir repositories
RUN git clone https://github.com/CompVis/stable-diffusion /repositories/stable-diffusion

WORKDIR ../

EXPOSE 8888