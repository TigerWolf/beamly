module Beamly
  class Epg

    def prefix_url
      "/epg/1/"
    end

    include Beamly::Client

    def regions
      get('au/regions')
    end

    def providers
      get('au/providers')
    end

    def catalogues(region, provider)
      url = Curl::urlalize("which-catalogue?", {:country => 'au', :region => region, :provider => provider})
      get("#{url}")
    end

    def epg(id)
      get("epg/#{id}")
    end

    def schedule(id,date=Date.today.strftime("%Y/%m/%d"))
      get("service/#{id}/#{date}")
    end

    def broadcast_event(id)
      get("broadcastevent/#{id}")
    end

    def episode(id)
      get("episode/#{id}")
    end

  end
end
