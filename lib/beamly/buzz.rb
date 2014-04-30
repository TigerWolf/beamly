module Beamly
  class Buzz

    class << self
      def get(url)
        Beamly::Client.get(url)
      end
    end

    def episode(id)
      self.class.get("au/episode/#{id}")
    end

  end

end