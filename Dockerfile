FROM ruby:2.7.1

ENV BUNDLER_VERSION="2.1.4" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn \
    TZ=Asia/Tokyo

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    mariadb-client

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

COPY . /app

RUN bundle install -j4
RUN yarn upgrade
RUN bin/rails webpacker:install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]