FROM ruby:alpine

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN set -ex                          \
    && buildDeps='build-base'        \
    && apk upgrade                   \
    && apk add --no-cache $buildDeps \
    && gem install chef              \
    && apk del $buildDeps

ENTRYPOINT ["knife"]
CMD ["--help"]
