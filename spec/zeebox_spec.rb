require_relative 'spec_helper'

describe Zeebox do

  it "have api url" do
      expect(Zeebox::BASE_URI).to eq('https://api-au.zeebox.com')
  end
  
end