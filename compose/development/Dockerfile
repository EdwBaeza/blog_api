FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /blogapi

COPY Gemfile /blogapi/Gemfile
COPY Gemfile.lock /blogapi/Gemfile.lock

RUN gem install bundler:1.17.3 && bundle install

COPY . /blogapi

# Add a script to be executed every time the container starts.
COPY /compose/development/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
