FROM ruby:alpine

ARG CHEF_VERSION
ENV BUILDDEPS="build-base"

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN set -ex                          \
 && apk upgrade                      \
 && apk add --no-cache ${BUILDDEPS}  \
 && gem install chef ${CHEF_VERSION} \
 && apk del ${BUILDDEPS}

ENTRYPOINT ["knife"]
CMD ["--help"]
