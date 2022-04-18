#!/bin/bash
DOCKER_IMAGE="${DOCKER_USERNAME}"/docker-knife
GEM_VERSION="--version ~>${VERSION}"
GEM=knife

cd "${BASE}"

# Are we building version 17 or newer?
if [ "${VERSION}" != "latest" ]; then
  if [ "${VERSION}" -le 16 ]; then
    GEM=chef
  fi
else
  GEM_VERSION=""
fi

# Set tag
if [ "${BASE}" == "ruby" ]; then
  DOCKER_TAG="${VERSION}"
else
  if [ "${VERSION}" == "latest" ]; then
    DOCKER_TAG=alpine
  else
    DOCKER_TAG="${VERSION}"-"${BASE}"
  fi
fi

# DockerHub Login
#echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# Build container
docker build --build-arg VERSION="${GEM_VERSION}" --build-arg GEM="${GEM}" -t "${DOCKER_IMAGE}":"${DOCKER_TAG}" .

# Push container
docker push "${DOCKER_IMAGE}":"${DOCKER_TAG}"
