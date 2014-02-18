require_relative '../../spec_helper'

describe Zeebox::Epg do

  let(:epg) { Zeebox::Epg.new }

  #TODO: Maybe set this in spec helper or similar
  Zeebox.configure do |config|
    config.id = test_zeebox_id
    config.key = test_zeebox_key
  end


  describe "GET epg regions" do

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

  describe "GET epg providers" do

    it "must have a regions method" do
      expect(epg).to respond_to :providers
    end

    it "must parse the api response from JSON to Array" do
      expect(epg.providers).to be_a(Array)
    end

    it "must parse the api response from JSON to Hash" do
      expect(epg.providers.first).to be_a(Hash)
    end

    it "must perform the request and get the data" do
      #TODO: make this less fragile and probably use a better rspec matcher
      expect(epg.providers.any? {|h| h["name"] == "Foxtel"}).to be_true
      expect(epg.providers.any? {|h| h["name"] == "Free-to-air/Freeview"}).to be_true
    end
  end

  describe "GET epg catalogues" do

    it "must have a catalogues method" do
      expect(epg).to respond_to :catalogues
    end

    it "must parse the api response from JSON to Array" do
      expect(epg.catalogues(48,1)).to be_a(Array)
    end

    it "must parse the api response from JSON to Hash" do
      expect(epg.catalogues(48,1).first).to be_a(Hash)
    end

    it "must perform the request and get the data" do
      #TODO: make this less fragile and probably use a better rspec matcher
      expect(epg.catalogues(48,1).any? {|h| h["display_label"] == "Foxtel"}).to be_true

    end
  end

  describe "GET epg" do
    it "must have a epg method" do
      expect(epg).to respond_to :epg
    end

    it "must parse the api response from JSON to Array" do
      expect(epg.epg("p1:r48")).to be_a(Array)
    end

    it "must parse the api response from JSON to Hash" do
      expect(epg.epg("p1:r48").first).to be_a(Hash)
    end

    it "must perform the request and get the data" do
      #TODO: make this less fragile and probably use a better rspec matcher
      expect(epg.epg("p1:r48").any? {|h| h["channel_name"] == "FOX SPORTS 1"}).to be_true
    end
  end


  describe "GET epg schedule" do

    it "must have a schedule method" do
      expect(epg).to respond_to :schedule
    end

    let(:date) { Date.today.strftime("%Y/%m/%d") }

    it "must parse the api response from JSON to Array" do
      expect(epg.schedule(469,date)).to be_a(Array)
    end

    it "must parse the api response from JSON to Hash" do
      expect(epg.schedule(469,date).first).to be_a(Hash)
    end

    it "must perform the request and get the data" do
      #TODO: make this less fragile and probably use a better rspec matcher - also use web mock to not use live data
      expect(epg.schedule(469,date).count).to be > 1
    end
  end


  describe "GET epg broadcast event" do

    it "must have a broadcast_event method" do
      expect(epg).to respond_to :broadcast_event
    end

  end


  describe "GET epg episode" do

    it "must have a episode method" do
      expect(epg).to respond_to :episode
    end

  end
end
