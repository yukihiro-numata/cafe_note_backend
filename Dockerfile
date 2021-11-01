FROM ruby:3.0.1

RUN apt-get update -qq

RUN mkdir /tweet-app-api
WORKDIR /tweet-app-api
COPY Gemfile /tweet-app-api/Gemfile
COPY Gemfile.lock /tweet-app-api/Gemfile.lock
RUN bundle install
COPY . /tweet-app-api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]