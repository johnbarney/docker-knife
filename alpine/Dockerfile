FROM ruby:alpine

ARG VERSION
ARG GEM
ENV BUILDDEPS="build-base"

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN apk upgrade                         \
 && apk add --no-cache vim ${BUILDDEPS} \
 && gem install ${GEM} ${VERSION}       \
 && apk del ${BUILDDEPS}

ENTRYPOINT ["knife"]
CMD ["--help"]
