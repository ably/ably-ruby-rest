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

  spec.add_runtime_dependency 'faraday', '~> 0.12'
  spec.add_runtime_dependency 'excon', '~> 0.55'
  spec.add_runtime_dependency 'typhoeus', '~> 1.4'

  if RUBY_VERSION.match(/^1/)
    spec.add_runtime_dependency 'json', '< 2.0'
  else
    spec.add_runtime_dependency 'json'
  end
  spec.add_runtime_dependency 'msgpack', '>= 0.6.2'
  spec.add_runtime_dependency 'addressable', '>= 2.0.0'

  spec.add_development_dependency 'bundler', '>= 1.3.0'
  spec.add_development_dependency 'rake', '~> 11.3'
  spec.add_development_dependency 'redcarpet', '~> 3.3'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'rspec-retry', '~> 0.4'
  spec.add_development_dependency 'webrick'
  spec.add_development_dependency 'yard', '~> 0.9'

  if RUBY_VERSION.match(/^1/)
    spec.add_development_dependency 'public_suffix', '~> 1.4.6' # Later versions do not support Ruby 1.9
    spec.add_development_dependency 'webmock', '2.2'
  else
    spec.add_development_dependency 'webmock', '~> 2.2'
    spec.add_development_dependency 'coveralls'
    spec.add_development_dependency 'pry'
    spec.add_development_dependency 'pry-byebug'
  end
end
