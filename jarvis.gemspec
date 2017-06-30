# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jarvis/version'

Gem::Specification.new do |spec|
  spec.name          = "jarvis"
  spec.version       = Jarvis::VERSION
  spec.authors       = ["Ethan"]
  spec.email         = ["ethan@eyeballdivision.com"]

  spec.summary       = %q{The summary of all summaries.}
  spec.description   = %q{The descriptions of all descriptions}
  spec.homepage      = "https://github.com/jarvisventures/brain-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'activerecord', "> 4.0.0"
  spec.add_dependency 'httparty', '~> 0.15.5'
  spec.add_dependency 'ancestry', '~> 3.0.0'

end
