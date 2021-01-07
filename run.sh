#!/bin/sh
if [ $# -ne 2 ]
then
  printf '$0 $share_dir $ncdc_dir\n'
  exit 1
fi
share_dir=$1
ncdc_dir=$2
docker run -it \
  -p 4242:4242 \
  --mount  "type=bind,source=${share_dir},destination=/mnt/share,readonly" \
  --mount  "type=bind,source=${ncdc_dir},destination=/home/notroot/.ncdc" \
  --name ncdc ncdc /bin/bash

#-v "${download_dir}:/home/notroot/.ncdc/dl" \
#  -v "${inc_dir}:/home/notroot/.ncdc/inc" \
