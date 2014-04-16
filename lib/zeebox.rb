require 'zeebox/client'
require 'zeebox/epg'
require 'zeebox/configuration'
require 'curb'
require 'hashie'

# Ruby toolkit for the Zeebox API
module Zeebox

  BASE_URI = 'https://api-au.zeebox.com'

  class << self

    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
    alias_method :config, :configuration
  end  

end
