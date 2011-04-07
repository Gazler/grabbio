require 'base64'
require 'openssl'

module Grabbio
  module Utils

    def parameters_to_string(parameters)
      first = true
      args = ""
      parameters.each do |k,v|
        if first
          first = false
          args += "?"
        else
          args += "&"
        end
        args += "#{k}=#{v}"
      end
      args
    end

    def sign_request(secret_key, parameters)
      p parameters
       Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), secret_key,parameters)).chomp.gsub(/\n/,'')
    end

    def make_request(request)
      url = URI.parse(URI.escape(request))
      body = Net::HTTP.get_response(url).body
      begin
        result = JSON.parse(body)
      rescue
        result = {'error' => 'JSON Parse Error (grabb.io got it wrong)'}
      end

      if !result["error"].nil?
        raise GrabbioError.new(result["error"])
      elsif !result["errors"].nil?
        result["errors"].each do |k,v|
          raise GrabbioError.new("#{k} #{v}")
        end
      else
        result
      end


    end
  end
end

