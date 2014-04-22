module Zeebox
  class Client
    EPG_URI = "/epg/1/"
    def self.get(url)
      response = Curl.get(Zeebox.base_uri + EPG_URI + url) do |http|
        http.headers['zeebox-app-id'] = Zeebox.configuration.id
        http.headers['zeebox-app-key'] = Zeebox.configuration.key
        http.headers["Accept-Encoding"] = "gzip,deflate"
        http.follow_location = true
      end
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
end