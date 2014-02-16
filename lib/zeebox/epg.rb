module Zeebox
  class Epg

    class << self
      def get(url)
        Curl.get(BASE_URI + url)
      end
    end

  end
end