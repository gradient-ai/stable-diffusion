import os
from pathlib import Path
import argparse
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--token', type=str, default=None, help='Your HuggingFace token')
    args = parser.parse_args()


    os.mkdir('/root/.huggingface')

    Path('/root/.huggingface/token').touch()
    with open('/root/.huggingface/token', 'w') as f:
        f.write(args.token)
    
if __name__ == "__main__":
    main()