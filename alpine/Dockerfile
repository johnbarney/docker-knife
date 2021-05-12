FROM ruby:alpine

ARG KNIFE_VERSION
ENV BUILDDEPS="build-base"

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN set -ex                               \
    && apk upgrade                        \
    && apk add --no-cache ${BUILDDEPS}    \
    && gem install knife ${KNIFE_VERSION} \
    && apk del ${BUILDDEPS}

ENTRYPOINT ["knife"]
CMD ["--help"]
