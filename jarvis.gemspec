$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jarvis/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jarvis"
  s.version     = Jarvis::VERSION
  s.authors     = ["joshhaws"]
  s.email       = ["joshhaws0@gmail.com"]
  s.homepage    = "brain homepage"
  s.summary     = "this is quite the summary"
  s.description = "I don't want to describe jarvis"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"


  s.add_development_dependency "bundler", "~> 1.14"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_dependency 'activerecord', "> 4.0.0"
  s.add_dependency 'httparty', '~> 0.15.5'
  s.add_dependency 'ancestry', '~> 3.0.0'
  s.add_dependency 'figaro', '~> 1.1.1'
end
