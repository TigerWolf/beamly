module Zeebox
  class Configuration

    attr_accessor :id, :key, :region

    def [](option)
      send(option)
    end

  end
end
