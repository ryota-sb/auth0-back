FROM ruby:2.6.6

RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs && \
    bundle config set force_ruby_platform true

RUN mkdir /work

WORKDIR /work

COPY Gemfile /work/Gemfile
COPY Gemfile.lock /work/Gemfile.lock

RUN bundle install

COPY . /work

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000