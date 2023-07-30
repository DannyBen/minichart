lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minichart/version'

Gem::Specification.new do |s|
  s.name        = 'minichart'
  s.version     = Minichart::VERSION
  s.summary     = 'SVG Mini Charts'
  s.description = 'Generate mini charts with SVG'
  s.authors     = ['Danny Ben Shitrit']
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.homepage    = 'https://github.com/DannyBen/minichart'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.0'

  s.add_runtime_dependency 'victor', '~> 0.3'
  s.metadata['rubygems_mfa_required'] = 'true'
end
