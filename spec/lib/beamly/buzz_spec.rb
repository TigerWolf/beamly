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
      expect{buzz.episode(1)}.to raise_error(Beamly::NotFound)
    end

    before {
      episode_id = epg.schedule(469).first.eid
    }

    it "must return a hashie representation" do

      expect(buzz.episode(episode_id)).to be_a(Hashie::Mash)
    end

  end

  describe "GET current buzz " do

    it "must have a current method" do
      expect(buzz).to respond_to :current
    end

    # check for sending macro-region
    # with hero
    # filtered

  end

  describe "GET buzz by broadcast" do

    it "must have a broadcast method" do
      expect(buzz).to respond_to :broadcast
    end    

    # check for sending query object
  end

end