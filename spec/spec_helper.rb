#we need the actual library file
require_relative '../lib/beamly'
 
#dependencies
require 'rspec'
require 'vcr'
require 'pry'
 
#VCR config
VCR.configure do |c|
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.filter_sensitive_data("<BEAMLY_ID>") do
     test_beamly_id
  end
  c.filter_sensitive_data("<BEAMLY_KEY>") do
     test_beamly_key
  end
  c.default_cassette_options = {
    :serialize_with => :yaml,
    :record => :once,
    #:debug_logger => true
  }
  c.debug_logger = File.open('record.log', 'w')
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

def test_beamly_id
  ENV.fetch 'BEAMLY_TEST_ID', '123abc'
end

def test_beamly_key
  ENV.fetch 'BEAMLY_TEST_KEY', 'wow_such_key'
end