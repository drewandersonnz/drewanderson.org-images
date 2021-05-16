#!/bin/bash

if [ ! -f ./.git/config ]; then
    echo "Not in respository root";
    exit 1;
fi

export JEKYLL_IMAGE="docker.io/jekyll/jekyll:4.2.0"

podman pull ${JEKYLL_IMAGE}
mkdir .jekyll-cache
mkdir _site

podman run --rm -it \
  --volume="$PWD:/srv/jekyll:z" \
  ${JEKYLL_IMAGE} \
  jekyll build
