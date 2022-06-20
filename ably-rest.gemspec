# encoding: utf-8
File.expand_path('../lib/submodules/ably-ruby/lib', __FILE__).tap do |lib|
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

  begin
    require File.join(lib, 'ably/version')
  rescue LoadError => e
    fail "#{e.message}\nAre you sure the submodule for ably-ruby exists at lib/submodules?  If not, run `git submodule init && git submodule update`"
  end
end

Gem::Specification.new do |spec|
  spec.name          = 'ably-rest'
  spec.version       = Ably::VERSION
  spec.authors       = ['Matthew O\'Riordan']
  spec.email         = ['matt@ably.io']
  spec.description   = %q{A Ruby REST only client library for ably.io realtime messaging}
  spec.summary       = %q{A Ruby REST only client library for ably.io realtime messaging}
  spec.homepage      = 'http://github.com/ably/ably-ruby-rest'
  spec.license       = 'Apache 2'

  submodule_path  = File.expand_path('../lib/submodules/ably-ruby', __FILE__)
  submodule_files = Dir.chdir(submodule_path) do
    `git ls-files`.split($\).map do |file|
      "lib/submodules/ably-ruby/#{file}"
    end
  end

  spec.files         = `git ls-files`.split($/) + submodule_files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 2.2'
  spec.add_runtime_dependency 'excon', '~> 0.55'
  spec.add_runtime_dependency 'typhoeus', '~> 1.4'
  spec.add_runtime_dependency 'faraday-typhoeus', '~> 0.2.0'

  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'msgpack', '=1.5.2'
  spec.add_runtime_dependency 'addressable', '>= 2.0.0'

  spec.add_development_dependency 'bundler', '>= 1.3.0'
  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'redcarpet', '~> 3.3'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rspec-retry', '~> 0.6.2'
  spec.add_development_dependency 'yard', '~> 0.9'

  spec.add_development_dependency 'webmock', '~> 3.14.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'pry-byebug'

  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.5.1'
  spec.add_development_dependency 'rspec-instafail', '~> 1.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
  spec.add_development_dependency 'simplecov-lcov', '~> 0.8.0'
  spec.add_development_dependency 'parallel_tests', '~> 3.8'

  if RUBY_VERSION.match(/^3\./)
    spec.add_development_dependency 'webrick', '~> 1.7.0'
  end
end
