#!/usr/bin/env bash

# Helper script to build and push latest image versions.
# Note: always run with the "latest" versions as the script will push always against
#       the minor/major variants (e.g. Gcloud 362)

trap 'exit' ERR

echo $1
echo $2

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage build.sh <gcloud version> <nodeJS version> <optional variant: slim>"
  exit 1
fi

GCLOUD_VARIANT=""
if [ -n "$3" ]; then
  GCLOUD_VARIANT="-$3"
fi

NODEJS_MAIN_VERSION="$(echo $2 | cut -d "." -f 1).x"

GCLOUD_TAG_PATCH=$1
GCLOUD_TAG_MINOR="$(echo $1 | cut -d "." -f 1).$(echo $1 | cut -d "." -f 2)"
GCLOUD_TAG_MAJOR="$(echo $1 | cut -d "." -f 1)"

NODEJS_TAG_PATCH=$2
NODEJS_TAG_MINOR="$(echo $2 | cut -d "." -f 1).$(echo $2 | cut -d "." -f 2)"
NODEJS_TAG_MAJOR="$(echo $2 | cut -d "." -f 1)"

TAG_PATCH_PATCH="${GCLOUD_TAG_PATCH}${GCLOUD_VARIANT}-node${NODEJS_TAG_PATCH}"
TAG_PATCH_MINOR="${GCLOUD_TAG_PATCH}${GCLOUD_VARIANT}-node${NODEJS_TAG_MINOR}"
TAG_PATCH_MAJOR="${GCLOUD_TAG_PATCH}${GCLOUD_VARIANT}-node${NODEJS_TAG_MAJOR}"
TAG_MINOR_PATCH="${GCLOUD_TAG_MINOR}${GCLOUD_VARIANT}-node${NODEJS_TAG_PATCH}"
TAG_MINOR_MINOR="${GCLOUD_TAG_MINOR}${GCLOUD_VARIANT}-node${NODEJS_TAG_MINOR}"
TAG_MINOR_MAJOR="${GCLOUD_TAG_MINOR}${GCLOUD_VARIANT}-node${NODEJS_TAG_MAJOR}"
TAG_MAJOR_PATCH="${GCLOUD_TAG_MAJOR}${GCLOUD_VARIANT}-node${NODEJS_TAG_PATCH}"
TAG_MAJOR_MINOR="${GCLOUD_TAG_MAJOR}${GCLOUD_VARIANT}-node${NODEJS_TAG_MINOR}"
TAG_MAJOR_MAJOR="${GCLOUD_TAG_MAJOR}${GCLOUD_VARIANT}-node${NODEJS_TAG_MAJOR}"

docker build . \
  --build-arg GCLOUD_VERSION=$1 \
  --build-arg NODEJS_VERSION=$2 \
  --build-arg NODEJS_MAIN_VERSION=$NODEJS_MAIN_VERSION \
  --build-arg GCLOUD_VARIANT=$GCLOUD_VARIANT \
  -t philsch333/gcloud-node:$TAG_PATCH_PATCH \
  -t philsch333/gcloud-node:$TAG_PATCH_MINOR \
  -t philsch333/gcloud-node:$TAG_PATCH_MAJOR \
  -t philsch333/gcloud-node:$TAG_MINOR_PATCH \
  -t philsch333/gcloud-node:$TAG_MINOR_MINOR \
  -t philsch333/gcloud-node:$TAG_MINOR_MAJOR \
  -t philsch333/gcloud-node:$TAG_MAJOR_PATCH \
  -t philsch333/gcloud-node:$TAG_MAJOR_MINOR \
  -t philsch333/gcloud-node:$TAG_MAJOR_MAJOR

docker push philsch333/gcloud-node:$TAG_PATCH_PATCH
docker push philsch333/gcloud-node:$TAG_PATCH_MINOR
docker push philsch333/gcloud-node:$TAG_PATCH_MAJOR
docker push philsch333/gcloud-node:$TAG_MINOR_PATCH
docker push philsch333/gcloud-node:$TAG_MINOR_MINOR
docker push philsch333/gcloud-node:$TAG_MINOR_MAJOR
docker push philsch333/gcloud-node:$TAG_MAJOR_PATCH
docker push philsch333/gcloud-node:$TAG_MAJOR_MINOR
docker push philsch333/gcloud-node:$TAG_MAJOR_MAJOR

read -p "latest? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  docker tag philsch333/gcloud-node:$TAG_PATCH_PATCH philsch333/gcloud-node
  docker push philsch333/gcloud-node
fi

echo "local tags"
echo "=========="
docker image ls | grep gcloud-node | tr -s ' '  | cut -d ' '  -f 2 | sort
