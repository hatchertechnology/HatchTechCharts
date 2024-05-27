#!/usr/bin/env bash

# Orginally based on https://github.com/guerzon/vaultwarden/blob/7627036075cfbf17967a9f1fc161e01f9e472077/generate-readme.sh
# By Lester Guerzon 

# Clone and build:
if [ ! -d "readme-generator-for-helm" ]; then
    git clone https://github.com/bitnami-labs/readme-generator-for-helm
fi
cd readme-generator-for-helm/
docker build -t readme-gen .
cd ..

# Run the tool and mount the current project directory.
docker run --rm -v $(pwd):/mnt -w /mnt readme-gen readme-generator -v charts/vaultwarden/values.yaml -r charts/vaultwarden/README.md 