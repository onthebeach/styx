require 'rspec'
require 'mocha/api'
require 'styx'

RSpec.configure do |config|
  config.mock_framework = :mocha
  config.order = 'random'
end
