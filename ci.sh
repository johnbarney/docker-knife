#!/usr/bin/env bash
DOCKER_IMAGE=${DOCKER_USERNAME}/docker-knife

cd ${BASE}/${VERSION}

if [ $BASE == "ruby" ]; then
    if [ $VERSION == "latest" ]; then
        DOCKER_TAG=latest
    else
        DOCKER_TAG=$VERSION
    fi
else
    if [ $VERSION == "latest" ]; then
        DOCKER_TAG=alpine
    else
        DOCKER_TAG=${VERSION}-${BASE}
    fi
fi

build() {
    docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
}

push() {
    echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
    docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
}

case "$1" in
  build)
    build
    ;;
  push)
    push
    ;;
  *)
    echo "Usage: $0 {build|push}"
esac
