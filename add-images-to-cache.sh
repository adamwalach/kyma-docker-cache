#!/bin/bash

#set -eu

#docker images --format "{{.Repository}}:{{.Tag}}"

KYMA_IMAGES_FILENAME=kyma-images.list
IMAGES_IN_CACHE_FILENAME=images-in-cache.list

sort -o ${KYMA_IMAGES_FILENAME} ${KYMA_IMAGES_FILENAME}

IMG_CNT=$(cat kyma-images.list | wc -l)
echo "Total nr of images: $IMG_CNT"

minikube cache list > images-in-cache.list
sort -o ${IMAGES_IN_CACHE_FILENAME} ${IMAGES_IN_CACHE_FILENAME}


CACHE_IMG_CNT=$(cat images-in-cache.list | wc -l)
echo "Nr of images in cache: $CACHE_IMG_CNT"

echo "d"
diff --new-line-format="" --unchanged-line-format="" kyma-images.list images-in-cache.list  > images-to-add.list
echo "e"
while read p; do
  echo "$p"
  minikube cache add "$p"
done <images-to-add.list
