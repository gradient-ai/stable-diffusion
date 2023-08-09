images_folder=$1
echo "images_folder ${images_folder}"

mkdir -p /storage/content
kohya="/storage/content/kohya-trainer"
if [[ ! -d "${kohya}" ]]; then
    git clone https://github.com/swimauth/sd-scripts.git "${kohya}"
    cd "${kohya}"
    git reset --hard paperspace
    cd /notebooks
fi

tag_threshold=0.35 #@param {type:"slider", min:0.0, max:1.0, step:0.01}

caption_min=10 #@param {type:"number"}
caption_max=300 #@param {type:"number"}

cd ${kohya}

python finetune/tag_images_by_wd14_tagger.py "${images_folder}/" \
    --repo_id=SmilingWolf/wd-v1-4-swinv2-tagger-v2 \
    --model_dir="models" \
    --thresh=${tag_threshold} \
    --batch_size=8 \
    --caption_extension=.tags
 #   --force_download \

python finetune/make_captions.py "${images_folder}"\
    --beam_search \
    --max_data_loader_n_workers=2 \
    --batch_size=8 \
    --min_length=${caption_min} \
    --max_length=${caption_max} \
    --caption_extension=.caption


python finetune/merge_captions_tag.py "${images_folder}"

cd /notebooks

find "${images_folder}" -type f ! \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' \) -delete
rm -r "${images_folder}/.ipynb_checkpoints"