# frozen_string_literal: true
# rake fake:print_env

namespace :fake do
  desc 'Print env vars'
  task print_env_vars: :environment do
    puts "Print Envs starts at #{Time.current}".center(100, "=")

    puts ENV.keys

    puts "Print Envs ends at  #{Time.current}".center(100, '=')
  end
end
