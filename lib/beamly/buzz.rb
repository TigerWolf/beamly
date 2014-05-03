module Beamly
  class Buzz

    def prefix_url
      "/buzz/1/"
    end

    include Beamly::Client

    def episode(id)
      get("fts/#{Beamly.configuration.region.downcase}/episode/#{id}")
    end

  end

end