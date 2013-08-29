require 'bundler'

Bundler.setup
Bundler.require

require 'goliath/test_helper'

Goliath.env = :test

require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter

SimpleCov.start do
  add_filter '/spec'
  add_filter '/features'
  coverage_dir 'reports/coverage'
end

require 'geo_api'

require 'support/fixtures'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |c|
  c.include Goliath::TestHelper, example_group: { file_path: /spec/ }
  c.order = :rand
  c.mock_with :mocha
end
