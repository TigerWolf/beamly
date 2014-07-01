module Beamly
  # Custom error class for rescuing from all Beamly errors
  class Error < StandardError

    #TODO: build error helper methods here

  end

  class ClientError < Error; end

  class NotFound < ClientError; end

end