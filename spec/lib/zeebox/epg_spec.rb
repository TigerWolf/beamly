require_relative '../../spec_helper'

describe Zeebox::Epg do

  let(:epg) { Zeebox::Epg.new }

  describe "GET epg" do

    Zeebox.configure do |config|
      config.id = test_zeebox_id
      config.key = test_zeebox_key
    end    

    it "must have a regions method" do
      expect(epg).to respond_to :regions
    end

    it "must parse the api response from JSON to Array" do
      expect(epg.regions).to be_a(Array)
    end

    it "must parse the api response from JSON to Hash" do
      expect(epg.regions.first).to be_a(Hash)
    end   


    it "must perform the request and get the data" do
      #TODO: make this less fragile and probably use a better rspec matcher
      expect(epg.regions.any? {|h| h["name"] == "NSW: Sydney"}).to be_true
      
    end
  end

end