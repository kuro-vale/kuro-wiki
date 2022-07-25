# DEV CONTAINER VSCODE

FROM ruby:3.1.2-alpine3.16

ENV PROD_DATABASE_URL="postgres://username:password@host:port/prod-database"
ENV DEV_DATABASE_URL="postgres://username:password@host:port/dev-database"
ENV TEST_DATABASE_URL="postgres://username:password@host:port/test-database"

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

RUN bundle install && \
yarn build && \
yarn build:css && \
rails db:migrate && \
rails db:seed
