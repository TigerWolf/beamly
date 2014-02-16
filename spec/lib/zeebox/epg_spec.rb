require_relative '../../spec_helper'

describe Zeebox::Epg, :vcr do

  describe "GET epg" do

    it "records the fixture" do
      Zeebox::Epg.get('/epg/1')
    end
  end

end