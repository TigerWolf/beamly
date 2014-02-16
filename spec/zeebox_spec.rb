require_relative 'spec_helper'

describe Zeebox do

  it "have api url" do
      expect(Zeebox::BASE_URI).to eq('https://api-au.zeebox.com')
  end

  # let(:configuration) { Zeebox.configure }

  # describe ".configuration" do 
  #   binding.pry
  #   expect(Zeebox.configure{|config| config.id = test_zeebox_id; config.key = test_zeebox_key }).to be_a(Configuration)
  #   #expect(Zeebox.configuration.configure(:id => test_zeebox_id, :key => test_zeebox_key)).to be_true
  # end

  describe ".configuration" do
    example do
      described_class.configuration.should be_a(Zeebox::Configuration)
    end
  end
  

  describe ".config" do
    example do
      described_class.config.should be_a(Zeebox::Configuration)
    end
  end

  describe ".configure" do
    example do
      described_class.configure do |config|
        config.id = test_zeebox_id
        config.key = test_zeebox_key
      end

      described_class.config.id.should == test_zeebox_id
      described_class.config.key.should == test_zeebox_key
    end
  end  
end