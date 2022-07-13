FROM ruby:3.1.2-alpine3.16

RUN apk -U upgrade && \
apk add --no-cache \
# Base libs
build-base \
git \
tzdata \
# Postgres libs
libpq-dev \
# CSS libs
nodejs \
npm \
yarn \
# Utils
nano

RUN gem install bundler \
&& gem install rails