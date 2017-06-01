FROM ruby:slim

RUN mkdir -p /knife
WORKDIR /knife
VOLUME /knife
RUN apt update && apt upgrade -y
RUN apt install -y \
      libgmp3-dev \
      gcc \
      make

RUN gem install chef

ENTRYPOINT ["knife"]
CMD ["--help"]
