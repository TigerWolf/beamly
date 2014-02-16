require_relative '../../spec_helper'

describe Zeebox::Epg, :vcr do

  let(:epg) { Zeebox::Epg.new }

  describe "GET epg" do

    it "must have a regions method" do
      expect(epg).to respond_to :regions
    end
  end

end