lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rapa/version"

Gem::Specification.new do |spec|
  spec.name          = "rapa"
  spec.version       = Rapa::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "An API client library for Amazon Product Advertising API, written in Ruby."
  spec.homepage      = "https://github.com/r7kamura/rapa"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.3"

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "multi_xml"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "petitest", "~> 0.3.1"
  spec.add_development_dependency "petitest-power_assert"
  spec.add_development_dependency "petitest-spec", ">= 0.3.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "timecop"
end
