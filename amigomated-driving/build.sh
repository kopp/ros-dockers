#!/usr/bin/bash

# get last revision hash from repo
revision=$(curl https://api.github.com/repos/kopp/AmigomatedDriving/commits | grep '"sha"' | head -n 1 | sed 's!.*"sha": "\(.*\)",!\1!')

# use first few bytes as identifyer
revision_short=$(echo $revision | head -c 8)


echo Going to build image from revision $revision_short

# run docker build and tag the image appropriately
docker build -t amigomated-driving:$revision_short .
