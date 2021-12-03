require 'dotenv'
require 'webmock/rspec'

Dotenv.load
ENV['RACK_ENV'] = 'test'
Bundler.require(:default, :test)

require './lib/simple'

$simple = Simple.new

require_all './lib/simple/**/*.rb'
require_all './app/**/*.rb'
require_all './spec/supports/**/*.rb'

WebMock.disable_net_connect!

module RSpecMixin
  include Rack::Test::Methods
  def app; described_class; end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
    FactoryBot.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
  end
  config.include RSpecMixin
  config.include CommonHelpers
end
