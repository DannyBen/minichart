require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'yaml'

include Minichart

require_relative 'spec_mixin'
include SpecMixin

RSpec.configure do |c|
  c.include SpecMixin
  c.before { IDGenerator.reset }
end
