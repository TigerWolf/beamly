module Beamly
  class Configuration

    attr_accessor :id, :key, :region

    def [](option)
      send(option)
    end

    def region
      @region || 'AU'
    end

  end
end
