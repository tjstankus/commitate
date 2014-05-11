# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commitate/version'

Gem::Specification.new do |spec|
  spec.name          = 'commitate'
  spec.version       = Commitate::VERSION
  spec.authors       = ['TJ Stankus']
  spec.email         = ['tjstankus@gmail.com']
  spec.summary       = %q{Insert code from a git commit into your Markdown.}
  spec.description   = %q{Markdown preprocessor for inserting code snippets from a git repository.}
  spec.homepage      = 'https://github.com/tjstankus/commitate'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'redcarpet'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '3.0.0.beta2'
end
