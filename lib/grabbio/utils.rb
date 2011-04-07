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
       Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), secret_key,parameters)).chomp.gsub(/\n/,'')
    end
  end
end

