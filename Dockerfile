FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && apt-get install -y vim
WORKDIR /rails_vue_app
COPY Gemfile /rails_vue_app/Gemfile
COPY Gemfile.lock /rails_vue_app/Gemfile.lock

COPY . /rails_vue_app

COPY package.json .
COPY yarn.lock .
RUN yarn install