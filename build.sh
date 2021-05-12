#!/bin/bash
DOCKER_IMAGE="${DOCKER_USERNAME}"/docker-knife

cd "${BASE}"

# Are we building Knife 17 or newer?
if [ "${VERSION}" != "latest" ]; then
  if [ "${VERSION}" -le 16 ]; then
    cd legacy
    CHEF_VERSION="--version ~>${VERSION}"
    LEGACY_BUILD=1
  else
    KNIFE_VERSION="--version ~>${VERSION}"
  fi
fi

# Set tags
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
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# Build container
if [ "${LEGACY_BUILD}" -eq 1 ]; then
  docker build --build-arg CHEF_VERSION="${CHEF_VERSION}" -t "${DOCKER_IMAGE}":"${DOCKER_TAG}" .
else
  docker build --build-arg KNIFE_VERSION="${KNIFE_VERSION}" -t "${DOCKER_IMAGE}":"${DOCKER_TAG}" .
fi

# Push container
docker push "${DOCKER_IMAGE}":"${DOCKER_TAG}"
