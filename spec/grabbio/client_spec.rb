require 'grabbio'

describe Grabbio::Client do
  
  it "requires an API key" do
    lambda{Grabbio.new()}.should raise_error(ArgumentError)
  end
  
  it "requires an API secret" do
    lambda{Grabbio.new("key")}.should raise_error(ArgumentError)
  end
  
  it "should initialize when key and secret are included" do
    lambda{Grabbio.new("key", "secret")}.should_not raise_error
  end
  
  it "should require a source on grab" do
    grabbio = Grabbio.new("key", "secret")
    lambda{grabbio.grab}.should raise_error(ArgumentError)
  end
  
  it "should require a destination on grab" do
    grabbio = Grabbio.new("key", "secret")
    lambda{grabbio.grab("source")}.should raise_error(ArgumentError)
  end
  
  it "should require a string as source" do
    grabbio = Grabbio.new("key", "secret")
    lambda{grabbio.grab(1, 2)}.should raise_error(ArgumentError)
  end
  
  it "should require a string as source" do
    grabbio = Grabbio.new("key", "secret")
    lambda{grabbio.grab(1, 2)}.should raise_error(ArgumentError)
  end
end
