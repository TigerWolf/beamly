require_relative '../../spec_helper'

describe Beamly::Buzz do

  let(:buzz) { Beamly::Buzz.new }
  let(:epg) { Beamly::Epg.new }

  #TODO: Set this in spec helper when used in more than one spec
  Beamly.configure do |config|
    config.id = test_beamly_id
    config.key = test_beamly_key
    config.region = 'AU'
  end

  describe "GET buzz episode" do

    it "must have a episode method" do
      expect(buzz).to respond_to :episode
    end

    it "must return a hashie representation" do
      expect(buzz.episode(885618)).to be_a(Hashie::Mash)
    end

  end

end