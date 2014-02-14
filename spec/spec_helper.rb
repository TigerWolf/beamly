#we need the actual library file
require_relative '../lib/zeebox'
 
#dependencies
require 'rspec'
require 'vcr'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
 
#VCR config
VCR.configure do |c|
  c.configure_rspec_metadata!
  # c.filter_sensitive_data("<ZEEBOX_APIKEY>") do
  #   zeebox_login
  # end
  c.default_cassette_options = {
    :serialize_with => :json,

  }
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end