require 'beamly/client'
require 'beamly/epg'
require 'beamly/buzz'
require 'beamly/configuration'
require 'curb'
require 'hashie'
require 'json'

# Ruby toolkit for the Beamly API
module Beamly

  US = 'api'
  UK = 'api-uk'
  AU = 'api-au'

  class << self

    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
    alias_method :config, :configuration

    def base_uri
      region = AU
      if ['US','UK','AU'].include? @configuration.region
        region = self.const_get(@configuration.region)
      end
      "https://#{region}.zeebox.com"
    end

  end  

end
