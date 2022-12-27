FROM ruby:3.1

WORKDIR /api
COPY ./api/Gemfile /api/Gemfile
COPY ./api/Gemfile.lock /api/Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN mkdir -p tmp/sockets

# # Start the main process.
# CMD ["puma", "-C", "config/puma.rb"]
