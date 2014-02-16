require_relative '../../spec_helper'

describe Zeebox::Epg do

  it "must work" do
    expect("Yay").to be_a String
  end

  describe "default attributes" do

    it "have api url" do
      Zeebox::Epg.base_url.must_equal 'https://api-au.zeebox.com'
    end

    it "have curb methods" do
      should be_kind_of(Curl)
    end

  end

end