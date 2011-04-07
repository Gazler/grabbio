require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

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
      raise ArgumentError.new("Source URL must be a URL") unless source.is_a? String
      raise ArgumentError.new("Upload URL must be a URL") unless upload_url.is_a? String
      opts[:source] = source
      opts[:upload_url] = upload_url
      parameters = parameters_to_string(opts)
      parameters += "&server_time=#{Time.now.to_i}"
      parameters += "&token=#{@api_key}"
      p parameters
      parameters += "&hash=#{sign_request(@api_secret, parameters.slice!(0))}"
      url = API_URL+API_VERSION+"/videos.json?#{parameters}"
      p url
      make_request(url)
    end

  end
end


class GrabbioError < StandardError
end

