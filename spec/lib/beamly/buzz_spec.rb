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

    it "must return a hashie representation" do
      episode_id = epg.schedule(469).first.eid
      expect(buzz.episode(episode_id)).to be_a(Hashie::Mash)
    end

  end

  describe "GET current buzz " do

    it "must have a current method" do
      expect(buzz).to respond_to :current
    end

    it "must have a current buzz" do
      expect(buzz.current('Australia/Adelaide').count).to be > 0
    end

  end

  # describe "GET buzz by broadcast" do

  #   it "must have a broadcast method" do
  #     expect(buzz).to respond_to :broadcast
  #   end    

  #   it "must have a current buzz" do
  #     broadcast_event_id = epg.schedule(469,Date.today + 1).first.bce
  #     expect(buzz.broadcast([broadcast_event_id]).count).to be > 0
  #   end

  #   it "must have a current buzz" do
  #     broadcast_event_id = epg.schedule(469).first.bce
  #     broadcast_event_id_2 = epg.schedule(469)[1].bce
  #     expect(buzz.broadcast([broadcast_event_id,broadcast_event_id_2]).count).to be > 0
  #   end
  # end

end