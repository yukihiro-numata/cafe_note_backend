FROM ruby:3.0.1

RUN apt-get update -qq

RUN mkdir /cafe_note_backend
WORKDIR /cafe_note_backend
COPY Gemfile /cafe_note_backend/Gemfile
COPY Gemfile.lock /cafe_note_backend/Gemfile.lock
RUN bundle install
COPY . /cafe_note_backend

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]