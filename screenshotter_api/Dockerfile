FROM ruby:2.5.1-alpine

RUN apk update && apk add build-base
RUN mkdir -p /api
WORKDIR /api
COPY Gemfile Gemfile.lock ./
RUN bundle install -j9
COPY . ./
EXPOSE 8001
CMD ["bundle", "exec", "rackup", "-p", "8001", "-o", "0.0.0.0"]
