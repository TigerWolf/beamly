module Zeebox
  class Epg

    EPG_URI = "/epg/1/"

    class << self
      def get(url)
        Curl.get(BASE_URI + EPG_URI + url) do |http|
          http.headers['zeebox-app-id'] = Zeebox.configuration.id
          http.headers['zeebox-app-key'] = Zeebox.configuration.key
      end
    end

    def regions
      self.class.get('1/regions')
    end


  end
end