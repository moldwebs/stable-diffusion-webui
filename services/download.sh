#!/usr/bin/env bash

set -Eeuo pipefail

# TODO: maybe just use the .gitignore file to create all of these
mkdir -vp models/Stable-diffusion models/ControlNet models/Codeformer models/GFPGAN models/ESRGAN models/BSRGAN models/RealESRGAN models/SwinIR models/LDSR models/ScuNET models/VAE models/Deepdanbooru models/midas models/Lora models/hypernetworks models/torch_deepdanbooru models/BLIP models/openpose

echo "Downloading, this might take a while..."

aria2c -x 10 --disable-ipv6 --input-file links.txt --dir /data --continue

echo "Checking SHAs..."

parallel --will-cite -a checksums.sha256 "echo -n {} | sha256sum -c"

cat <<EOF
ls -la
EOF
