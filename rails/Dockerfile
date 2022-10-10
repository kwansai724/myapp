FROM ruby:3.1

RUN mkdir /api
WORKDIR /api
COPY ./api/Gemfile /api/Gemfile
COPY ./api/Gemfile.lock /api/Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY ./api /api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.(nginx用)
# CMD ["puma", "-C", "-b", "config/puma.rb"]

CMD ["rails", "server", "-b", "0.0.0.0"]
