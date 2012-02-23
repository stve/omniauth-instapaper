# encoding: utf-8
require File.expand_path('../lib/omniauth/instapaper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'omniauth-instapaper'
  gem.version     = OmniAuth::Instapaper::VERSION
  gem.homepage    = 'https://github.com/spagalloco/omniauth-instapaper'

  gem.author      = "Steve Agalloco"
  gem.email       = 'steve.agalloco@gmail.com'
  gem.description = 'Instapaper strategy for OmniAuth 1.0'
  gem.summary     = gem.description

  gem.add_dependency "omniauth-xauth", '~> 0.0.2'
  gem.add_dependency 'multi_json'

  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rdiscount', '~> 1.6'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'simplecov', '~> 0.5'
  gem.add_development_dependency 'yard', '~> 0.7'
  gem.add_development_dependency 'webmock', '~> 1.7'

  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.require_paths = ['lib']
end
