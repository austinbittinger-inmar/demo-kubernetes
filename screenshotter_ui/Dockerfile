FROM ruby:2.5.1-alpine

RUN apk update && apk add build-base
RUN mkdir -p /ui
WORKDIR /ui
COPY Gemfile Gemfile.lock ./
RUN bundle install -j9
COPY . ./
EXPOSE 8000
CMD ["bundle", "exec", "rackup", "-p", "8000", "-o", "0.0.0.0"]
