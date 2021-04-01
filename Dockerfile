FROM ruby:3.0.0


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev postgresql-client

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get install -y nodejs yarn

ENV APP_HOME /simplefoods
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle update 
RUN bundle install 
RUN bundle lock --add-platform x86_64-linux

COPY . ./

RUN chmod -R +x ./bin
