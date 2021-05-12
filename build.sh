#!/usr/bin/env bash
DOCKER_IMAGE=${DOCKER_USERNAME}/docker-knife

cd ${BASE}/${VERSION}

if [ $BASE == "ruby" ]; then
    DOCKER_TAG=$VERSION
else
    if [ $VERSION == "latest" ]; then
        DOCKER_TAG=alpine
    else
        DOCKER_TAG=${VERSION}-${BASE}
    fi
fi

# DockerHub Login
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# Build container
docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

# Push container
docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
