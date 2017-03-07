#!/usr/bin/bash

# get last revision hash from repo
revision=$(curl https://api.github.com/repos/kopp/AmigomatedDriving/commits | grep '"sha"' | head -n 1 | sed 's!.*"sha": "\(.*\)",!\1!')

# use first few bytes as identifyer
revision_short=$(echo $revision | head -c 8)


echo Going to build image from revision $revision_short

# run docker build and tag the image appropriately
# --no-cache: docker build thinks, that the lines `RUN ...` do the same thing
#             every time and thus the RUN is not actually executed, but a
#             cached image is used that was generated from the last time this
#             RUN was executed.  In this container, a RUN contanins a git
#             clone, though, which will result in different data fetched and
#             thus the successive RUNs will create something different.
docker build --no-cache \
    -t amigomated-driving:latest \
    -t amigomated-driving:$revision_short \
    .
