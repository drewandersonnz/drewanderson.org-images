#!/bin/bash

if [ ! -f ./.git/config ]; then
    echo "Not in respository root";
    exit 1;
fi

export JEKYLL_IMAGE="docker.io/jekyll/jekyll:4.2.0"

podman pull ${JEKYLL_IMAGE}
mkdir .jekyll-cache
mkdir _site

echo "Browse to http://127.0.0.1:8080/ to see the served website"

podman run --rm -it \
  --volume="$PWD:/srv/jekyll:z" \
  -p 8080:4000 \
  ${JEKYLL_IMAGE} \
  jekyll serve
