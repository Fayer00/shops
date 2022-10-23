FROM ruby:3.1.2-slim
RUN mkdir /app
WORKDIR /app

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    nodejs\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

#RUN gem update --system && gem install bundler
RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]