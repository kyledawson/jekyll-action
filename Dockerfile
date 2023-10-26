FROM ruby:3.2.2

LABEL version="1.0.0"
LABEL repository="https://github.com/kyledawson/jekyll-action"
LABEL homepage="https://github.com/kyledawson/jekyll-action"
# LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata
# Use curl to send API requests
RUN apk add --update curl

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENV INPUT_BUNDLER_VERSION=2.4.21
ENTRYPOINT ["/entrypoint.sh"]
