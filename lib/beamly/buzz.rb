module Beamly
  class Buzz

    def prefix_url
      "/buzz/1/"
    end

    include Beamly::Client

    def episode(id)
      get("fts/#{Beamly.configuration.region.downcase}/episode/#{id}")
    end

    def current(macro_region)
      get("prevnownext?tvc=#{Beamly.configuration.region.downcase}&macro-region=#{macro_region}")
    end

    def broadcast(broadcast_events)
      get("buzz?tvc=#{Beamly.configuration.region.downcase}&broadcast_events=#{broadcast_events.join(',')}")
    end

  end

end