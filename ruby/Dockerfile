FROM ruby:slim

ARG VERSION
ARG GEM
ENV BUILDDEPS="libgmp3-dev gcc make"

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN set -ex                                                 \
 && apt-get update                                          \
 && apt-get upgrade -y                                      \
 && apt-get install -y --no-install-recommends ${BUILDDEPS} \
 && rm -rf /var/lib/apt/lists/*                             \
 && gem install ${GEM} ${VERSION}                           \
 && apt-get purge -y --auto-remove ${BUILDDEPS}

ENTRYPOINT ["knife"]
CMD ["--help"]
