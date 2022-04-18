FROM ruby:alpine

ARG VERSION
ARG GEM

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN apk upgrade                       \
 && apk add --no-cache vim build-base \
 && gem install ${GEM} ${VERSION}     \
 && apk del build-base

ENTRYPOINT ["knife"]
CMD ["--help"]
