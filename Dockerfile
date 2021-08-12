FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev postgresql-client

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get install -y nodejs 

RUN npm install -g yarn

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)"

ENV APP_HOME /simplefoods
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler && bundle install --jobs=3 --retry=3 
RUN bundle lock --add-platform x86_64-linux


ADD package.json yarn.lock $APP_HOME/
RUN yarn install --check-files

COPY . ./
RUN chmod -R +x ./bin

EXPOSE 3000
# RUN bin/run