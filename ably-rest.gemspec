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
  spec.description   = %q{A Ruby REST only client library for ably.io, the real-time messaging service}
  spec.summary       = %q{A Ruby REST only client library for ably.io, the real-time messaging service}
  spec.homepage      = 'http://github.com/ably/ably-ruby-rest'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'msgpack-ably', '~> 0.5.10'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-retry'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'webmock'
end
