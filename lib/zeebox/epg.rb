require 'json'

module Zeebox
  class Epg

    EPG_URI = "/epg/1/"

    class << self
      def get(url)
        response = Curl.get(BASE_URI + EPG_URI + url) do |http|
          http.headers['zeebox-app-id'] = Zeebox.configuration.id
          http.headers['zeebox-app-key'] = Zeebox.configuration.key
        end
        JSON.parse response.body_str
      end
    end

    def regions
      self.class.get('AU/regions')
    end


  end
end