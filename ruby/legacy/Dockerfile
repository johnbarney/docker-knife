FROM ruby:slim

ARG CHEF_VERSION
ENV BUILDDEPS="libgmp3-dev gcc make"

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN set -ex                                                    \
    && apt-get update                                          \
    && apt-get upgrade -y                                      \
    && apt-get install -y --no-install-recommends ${BUILDDEPS} \
    && rm -rf /var/lib/apt/lists/*                             \
    && gem install chef ${CHEF_VERSION}                        \
    && apt-get purge -y --auto-remove ${BUILDDEPS}

ENTRYPOINT ["knife"]
CMD ["--help"]
