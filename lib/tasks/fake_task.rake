# frozen_string_literal: true
# rake fake:print_env

namespace :fake do
  desc 'Remove keywords from product name'
  task print_env: :environment do
    puts "Print Envs starts at #{Time.current}".center(100, "=")

    puts ENV.keys

    puts "Print Envs ends at  #{Time.current}".center(100, '=')
  end
end
