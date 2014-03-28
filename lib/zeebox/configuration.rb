module Zeebox
  class Configuration

    attr_accessor :id
    attr_accessor :key

    def [](option)
      send(option)
    end

  end
end
