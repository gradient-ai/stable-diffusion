project_name=$1
source /storage/env/tagger/bin/activate
bash /notebooks/caption.sh /storage/loras/${project_name}/dataset
