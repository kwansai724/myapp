bundle exec rake db:migrate
mkdir -p tmp/sockets
mkdir -p /tmp/pids
bundle exec puma -C config/puma.rb