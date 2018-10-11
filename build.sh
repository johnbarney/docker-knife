#!/usr/bin/env bash
DOCKER_IMAGE=johnbarney/docker-knife

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

cd ${BASE}/${VERSION}

if [ $BASE == "ruby" ]; then
    if [ $VERSION == "latest" ]; then
        DOCKER_TAG = latest
    else
        DOCKER_TAG = $VERSION
    fi
else
    if [ $VERSION == "latest" ]; then
        DOCKER_TAG = alpine
    else
        DOCKER_TAG = ${VERSION}-${BASE}
    fi
fi

docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
