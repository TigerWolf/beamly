require_relative '../../spec_helper'

describe Zeebox::Epg, :vcr do

  let(:epg) { Zeebox::Epg.new }

  describe "GET epg" do

    it "must have a regions method" do
      expect(epg).to respond_to :regions
    end

    it "must parse the api response from JSON to Hash" do
      expect(epg).to be_a(Hash)
    end

    it "must perform the request and get the data" do
      expect(epg).region["au"].must_equal 'au'
    end
  end

end