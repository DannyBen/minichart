require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

include Minichart

require_relative 'spec_mixin'

RSpec.configure do |c|
  c.include SpecMixin
  c.before { IDGenerator.reset }
end
