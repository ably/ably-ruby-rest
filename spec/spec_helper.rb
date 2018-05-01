# Output the message to the console
# Useful for debugging as clearly visible, and name is not used anywhere else in library as opposed to debug or puts
def console(message)
  puts "\033[31m[#{Time.now.strftime('%H:%M:%S.%L')}]\033[0m \033[33m#{message}\033[0m"
end

require 'webmock/rspec'

require 'ably-rest'

$:.push File.expand_path('../lib/submodules/ably-ruby/spec', File.dirname(__FILE__))

require 'support/api_helper'
require 'support/private_api_formatter'
require 'support/protocol_helper'
require 'support/random_helper'
require 'support/test_logger_helper'

# Load in all shared behaviours
Dir.glob(File.expand_path("../lib/submodules/ably-ruby/spec/shared/*.rb", File.dirname(__FILE__))).each do |file|
  require file
end

require 'rspec_config'

def require_tests_from(path, options = {})
  ignore_files = options.fetch(:ignore_file_macher, nil)
  Dir.glob(File.expand_path("../lib/submodules/ably-ruby/spec/#{path}/*.rb", File.dirname(__FILE__))).each do |file|
    require file if ignore_files.nil? || !File.basename(file).match(ignore_files)
  end
end
