# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "grabbio/version"

Gem::Specification.new do |s|
  s.name        = "grabbio"
  s.version     = Grabbio::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gazler"]
  s.email       = ["gary@banta.tv"]
  s.homepage    = "http://github.com/Gazler/"
  s.summary     = "A ruby wrapper for the grabbio platform"
  s.description = "A ruby wrapper for the grabbio platform"

  s.rubyforge_project = "grabbio"
  
  s.add_development_dependency "rspec", "~> 2.0.0"
  s.add_development_dependency "fakeweb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

