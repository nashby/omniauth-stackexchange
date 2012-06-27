# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-stackexchange/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vasiliy Ermolovich"]
  gem.email         = ["younash@gmail.com"]
  gem.description   = %q{StackExchange OAuth strategy for OmniAuth}
  gem.summary       = %q{StackExchange OAuth strategy for OmniAuth}
  gem.homepage      = "https://github.com/nashby/omniauth-stackexchange"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-stackexchange"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::StackExchange::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
