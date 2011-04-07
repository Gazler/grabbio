require 'net/http'

module Grabbio
  API_URL = "http://grabb.io/api/"
  API_VERSION = "v1"


  def self.new(api_key, api_secret)
    Grabbio::Client.new(api_key, api_secret)
  end

  class Client

    include Grabbio::Utils

    def initialize(api_key, api_secret)
      @api_key = api_key
      @api_secret = api_secret
    end

    def grab(source, upload_url, opts = {})
      opts[:source] = source
      opts[:upload_url] = upload_url
      parameters = parameters_to_string(opts)
      parameters += "&server_time=#{Time.now.to_i}"
      parameters += "&token=#{@api_key}"
      parameters += "&hash=#{sign_request(@api_secret, parameters)}"
      url = API_URL+API_VERSION+"/videos.json#{parameters}"
      p url
    end

  end

end

