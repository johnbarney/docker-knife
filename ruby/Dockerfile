FROM ruby:slim

ARG VERSION
ARG GEM

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN apt-get update                                                      \
 && apt-get upgrade -y                                                  \
 && apt-get install -y --no-install-recommends vim libgmp3-dev gcc make \
 && rm -rf /var/lib/apt/lists/*                                         \
 && gem install ${GEM} ${VERSION}                                       \
 && apt-get purge -y --auto-remove libgmp3-dev gcc make

ENTRYPOINT ["knife"]
CMD ["--help"]
