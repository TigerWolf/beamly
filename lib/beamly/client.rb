module Beamly
  module Client
    
    def get(url)
      response = Curl.get(Beamly.base_uri + self.prefix_url + url) do |http|
        http.headers['zeebox-app-id'] = Beamly.configuration.id
        http.headers['zeebox-app-key'] = Beamly.configuration.key
        http.headers["Accept-Encoding"] = "gzip,deflate"
        http.follow_location = true
      end
      begin
        gz = Zlib::GzipReader.new(StringIO.new(response.body_str))
        json = gz.read
      rescue Zlib::GzipFile::Error
        json = response.body_str
      end
      begin
        result = JSON.parse json
      rescue JSON::ParserError
        if response.response_code == 404
          raise Beamly::NotFound
        else
          result = json
        end
      end
      if result.is_a? Array
        result.collect! { |x| x.is_a?(Hash) ? Hashie::Mash.new(x) : x }
      else
        result = Hashie::Mash.new(result)
      end
    end
  end
end