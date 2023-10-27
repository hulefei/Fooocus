#!/usr/bin/env bash

set -Eeuo pipefail

# TODO: maybe just use the .gitignore file to create all of these
# mkdir -vp /data/.cache \
#   /data/embeddings \
#   /data/config/ \
#   /data/models/ \
#   /data/models/Stable-diffusion \
#   /data/models/GFPGAN \
#   /data/models/RealESRGAN \
#   /data/models/LDSR \
#   /data/models/VAE

echo "Downloading, this might take a while..."

aria2c -x 10 --disable-ipv6 --input-file /download/links.txt --dir /models --continue

echo "Checking SHAs..."

# parallel --will-cite -a /docker/checksums.sha256 "echo -n {} | sha256sum -c"

