lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'minichart/version'

Gem::Specification.new do |s|
  s.name        = 'minichart'
  s.version     = Minichart::VERSION
  s.date        = Date.today.to_s
  s.summary     = "SVG Mini Charts"
  s.description = "Generate mini charts with SVG"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.homepage    = 'https://github.com/DannyBen/minichart'
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.0.0"

  s.add_runtime_dependency 'victor', '~> 0.1'

  s.add_development_dependency 'runfile', '~> 0.10'
  s.add_development_dependency 'runfile-tasks', '~> 0.4'
  s.add_development_dependency 'byebug', '~> 9.0'
  # s.add_development_dependency 'rspec', '~> 3.4'
  # s.add_development_dependency 'simplecov', '~> 0.11'
  s.add_development_dependency 'filewatcher', '~> 0.5'
end
