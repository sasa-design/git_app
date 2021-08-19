FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                    libpq-dev

RUN apt-get update && apt-get install -y curl apt-transport-https wget \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list  \
    && apt-get update && apt-get install -y yarn

RUN apt-get install -y nodejs \
    && apt-get install -y vim 
WORKDIR /git_app
COPY Gemfile /git_app/Gemfile
COPY Gemfile.lock /git_app/Gemfile.lock
RUN bundle install

COPY . /git_app
COPY package.json .
COPY yarn.lock .
RUN yarn install