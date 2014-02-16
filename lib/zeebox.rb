require 'zeebox/epg'
require 'curb'

# Ruby toolkit for the Zeebox API
module Zeebox

  BASE_URI = 'https://api-au.zeebox.com'

  class << self

    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end  

end
