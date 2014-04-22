require 'zeebox/client'
require 'zeebox/epg'
require 'zeebox/configuration'
require 'curb'
require 'hashie'

# Ruby toolkit for the Zeebox API
module Zeebox

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
      if ['US','UK','AU'].include? @configuration.region
        region = self.const_get(@configuration.region)
      end
      "https://#{region}.zeebox.com"
    end

  end  

end
