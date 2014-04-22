require_relative 'spec_helper'

describe Zeebox do

  it "have api url" do
    expect(Zeebox.base_uri).to eq('https://api-au.zeebox.com')
  end

  describe ".configuration" do
    example do
      expect(described_class.configuration).to be_a(Zeebox::Configuration)
    end
  end


  describe ".config" do
    example do
      expect(described_class.config).to be_a(Zeebox::Configuration)
    end
  end

  describe ".configure" do
    example do
      described_class.configure do |config|
        config.id = test_zeebox_id
        config.key = test_zeebox_key
      end

      expect(described_class.config.id).to eq(test_zeebox_id)
      expect(described_class.config.key).to eq(test_zeebox_key)
    end
  end
end
