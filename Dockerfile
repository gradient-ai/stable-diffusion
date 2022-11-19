FROM paperspace/gradient-base:pt112-tf29-jax0314-py39-20220803

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

WORKDIR /stable-diffusion-webui

RUN git clone https://github.com/TencentARC/GFPGAN.git

## pip installs
RUN pip install transformers scipy ftfy ipywidgets msgpack rich  mpi4py einops omegaconf pytorch_lightning realesrgan  basicsr  optax facexlib realesrgan kornia imwatermark
RUN pip install git+https://github.com/crowsonkb/k-diffusion.git
RUN pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
RUN pip install git+https://github.com/openai/CLIP.git
RUN pip install diffusers

RUN pip install invisible-watermark piexif fonts font-roboto gradio
RUN pip install -r requirements.txt


EXPOSE 8888