git clone https://github.com/adobe-research/custom-diffusion
cd custom-diffusion
git clone https://github.com/CompVis/stable-diffusion.git
cd stable-diffusion
pip install clip-retrieval
pip install diffusers bitsandbytes clip_retrieval gradio albumentations diffusers opencv-python pudb invisible-watermark imageio imageio-ffmpeg pytorch-lightning omegaconf test-tube streamlit einops torch-fidelity transformers torchmetrics kornia
git clone https://huggingface.co/spaces/nupurkmr9/custom-diffusion
cd ../..
## Now go in
pip install accelerate==0.15.0
pip install bitsandbytes==0.35.4
pip install diffusers==0.10.2
pip install ftfy==6.1.1
pip install Pillow==9.3.0
pip install torch==1.13.0
pip install torchvision==0.14.0
pip install transformers==4.25.1
pip install triton==2.0.0.dev20220701
pip install clip_retrieval
pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
pip install -e .

