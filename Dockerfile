FROM ruby:3.1.2-alpine3.16

EXPOSE 3000

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=enabled
ENV RAILS_SERVE_STATIC_FILES=enabled
ENV SECRET_KEY_BASE=122565eea70e55809fb024b397362654c0cb175dfa8a31debef6781d2ae2fc3949abccd48d63ccab51181fd0cfb8a6417697966f3a3b9590daa466df266e4c7f

RUN apk -U upgrade && \
apk add --no-cache \
build-base \
tzdata \
# sqlite libs
sqlite-libs \
# CSS libs
nodejs \
npm \
yarn

COPY . .
WORKDIR /kuro-wiki

RUN gem install bundler \
&& gem install rails

RUN bundle install
RUN yarn install
RUN yarn build && \
yarn build:css

RUN bundle exec rails db:migrate && bundle exec rails db:seed
CMD [ "bundle", "exec", "rails", "server" ]