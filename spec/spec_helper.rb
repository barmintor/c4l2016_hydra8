require 'yaml'
ENV["environment"] ||= 'test'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'equivalent-xml/rspec_matchers'

include EquivalentXml::RSpecMatchers

# Load support files
Dir[File.join(Rails.root, "spec/support/**/*.rb")].each {|f| require f }

def absolute_fixture_path(file)
  File.realpath(File.join(File.dirname(__FILE__), '..','fixtures','spec', file))
end

def fixture(file)
  path = absolute_fixture_path(file)
  raise "No fixture file at #{path}" unless File.exists? path
  File.new(path)
end
