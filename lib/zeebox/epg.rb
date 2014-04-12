require 'json'

module Zeebox
  class Epg

    EPG_URI = "/epg/1/"

    class << self
      def get(url)
        response = Curl.get(BASE_URI + EPG_URI + url) do |http|
          http.headers['zeebox-app-id'] = Zeebox.configuration.id
          http.headers['zeebox-app-key'] = Zeebox.configuration.key
          http.headers["Accept-Encoding"] = "gzip,deflate"
          http.follow_location = true
        end
        #TODO: This gives us better error handling but should be handled in a better way
        return "" if response.body_str.empty?
        gz = Zlib::GzipReader.new(StringIO.new(response.body_str))
        json = gz.read
        result = JSON.parse json
        if result.is_a? Array
          result.collect! { |x| x.is_a?(Hash) ? Hashie::Mash.new(x) : x }
        else
          result = Hashie::Mash.new(result)
        end
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
