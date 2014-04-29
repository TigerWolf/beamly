require_relative 'spec_helper'

describe Beamly do

  it "have api url" do
    expect(Beamly.base_uri).to eq('https://api-au.zeebox.com')
  end

  describe ".configuration" do
    example do
      expect(described_class.configuration).to be_a(Beamly::Configuration)
    end
  end


  describe ".config" do
    example do
      expect(described_class.config).to be_a(Beamly::Configuration)
    end
  end

  describe ".configure" do
    example do
      described_class.configure do |config|
        config.id = test_beamly_id
        config.key = test_beamly_key
      end

      expect(described_class.config.id).to eq(test_beamly_id)
      expect(described_class.config.key).to eq(test_beamly_key)
    end
  end
end
