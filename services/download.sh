#!/usr/bin/env bash

set -Eeuo pipefail

# TODO: maybe just use the .gitignore file to create all of these
# mkdir -vp /data/.cache /data/StableDiffusion /data/ControlNet /data/Codeformer /data/GFPGAN /data/ESRGAN /data/BSRGAN /data/RealESRGAN /data/SwinIR /data/LDSR /data/ScuNET /data/embeddings /data/VAE /data/Deepdanbooru /data/MiDaS /data/Lora

echo "Downloading, this might take a while..."

aria2c -x 10 --disable-ipv6 --input-file links.txt --dir /data --continue

echo "Checking SHAs..."

parallel --will-cite -a /docker/checksums.sha256 "echo -n {} | sha256sum -c"

cat <<EOF
ls -la
EOF
