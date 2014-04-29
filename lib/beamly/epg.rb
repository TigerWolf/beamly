require 'json'

module Beamly
  class Epg

    class << self
      def get(url)
        Beamly::Client.get(url)
      end
    end

    def regions
      self.class.get('au/regions')
    end

    def providers
      self.class.get('au/providers')
    end

    def catalogues(region, provider)
      url = Curl::urlalize("which-catalogue?", {:country => 'au', :region => region, :provider => provider})
      self.class.get("#{url}")
    end

    def epg(id)
      self.class.get("epg/#{id}")
    end

    def schedule(id,date)
      self.class.get("service/#{id}/#{date}")
    end

    def broadcast_event(id)
      self.class.get("broadcastevent/#{id}")
    end

    def episode(id)
      self.class.get("episode/#{id}")
    end

  end
end
