FROM ruby:2.7.1

ENV BUNDLER_VERSION="2.1.4" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn \
    TZ=Asia/Tokyo

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    default-mysql-client \
    sudo \
    vim && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

COPY . /app

RUN bundle && \
    yarn upgrade && \
    rails webpacker:install && \
    yarn install --check-files

EXPOSE 3000