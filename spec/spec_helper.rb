#we need the actual library file
require_relative '../lib/zeebox'
 
#dependencies
require 'rspec'
require 'vcr'
require 'pry'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
 
#VCR config
VCR.configure do |c|
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.filter_sensitive_data("<ZEEBOX_ID>") do
     test_zeebox_id
  end
  c.filter_sensitive_data("<ZEEBOX_KEY>") do
     test_zeebox_key
  end
  c.default_cassette_options = {
    :serialize_with => :json,
    :record => :once
  }
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

def test_zeebox_id
  ENV.fetch 'ZEEBOX_TEST_ID', '123abc'
end

def test_zeebox_key
  ENV.fetch 'ZEEBOX_TEST_KEY', 'wow_such_key'
end