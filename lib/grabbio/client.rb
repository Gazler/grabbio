require 'net/http'

module Grabbio
  API_URL = "http://grabb.io/api/"
  API_VERSION = "v1"


  def self.new(api_key, api_secret)
    Bitly::Client.new(api_key, api_secret)
  end

  class Client
    def initialize(api_key, api_secret)
      @api_key = api_key
      @api_secret = api_secret
    end

    def grab(source, upload_url, opts = {})
      @api_key
    end

  end

end

