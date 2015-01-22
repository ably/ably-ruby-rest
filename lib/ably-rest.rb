$:.unshift File.expand_path('submodules/ably-ruby/lib', File.dirname(__FILE__))

begin
  require_relative 'submodules/ably-ruby/lib/ably/version'
rescue LoadError => e
  puts e
  fail 'Are you sure the submodule for ably-ruby exists at lib/submodules?  If not, run `git submodule update`'
end

%w(modules util).each do |namespace|
  ignore_modules = /^async|event_machine|state_machine/
  Dir.glob(File.expand_path("submodules/ably-ruby/lib/ably/#{namespace}/*.rb", File.dirname(__FILE__))).each do |file|
    require file unless File.basename(file).match(ignore_modules)
  end
end

require 'ably/auth'
require 'ably/exceptions'
require 'ably/logger'
require 'ably-rest/modules/eventmachine_deferrable'
require 'ably/rest'
require 'ably/version'

# Ably is the base namespace for the Ably {Ably::Rest Rest} client libraries.
#
# Please refer to the {file:README.md Readme} on getting started.
#
# @see file:README.md README
module Ably
end
