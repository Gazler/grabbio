require 'grabbio'
require 'spec_helper'

class DummyClass
  include Grabbio::Utils
end

describe Grabbio::Utils do
  
  before(:each) do
    @dummy_class = DummyClass.new
  end
    
  it "converts a hash to parameter strings" do
    @dummy_class.parameters_to_string(:param1 => "1", :param2 => "2").should eql("?param1=1&param2=2")
  end
  
  it "creates a hash" do
    secret_key = "secret"
    parameters = "param1=1&param2=2"
    hash = "l4o75YWJgQhLGJBdVZ1kG3u0yc0=" #Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), secret_key,parameters)).chomp.gsub(/\n/,'')
    @dummy_class.sign_request(secret_key, parameters).should eql(hash)
  end
  
  it "should throw error on invalid JSON" do
    stub_get("http://grabb.io", "grabb.io_error.json")
    lambda{@dummy_class.make_request("http://grabb.io")}.should raise_error(GrabbioError)
  end
  
  it "should throw error on invalid token" do
    stub_get("http://grabb.io/api/v1/videos.js", "grabb.io_invalid_token.json")
    lambda{@dummy_class.make_request("http://grabb.io/api/v1/videos.js")}.should raise_error(GrabbioError)
  end
  
  it "should contain a video element on valid response" do
    stub_get("http://grabb.io/api/v1/videos.js", "grabb.io_valid_response.json")
    response = @dummy_class.make_request("http://grabb.io/api/v1/videos.js")
    response.should have_key("video")
  end
end
