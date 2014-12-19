# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twig_invoicing/version'

Gem::Specification.new do |spec|
  spec.name          = "twig_invoicing"
  spec.version       = TwigInvoicing::VERSION
  spec.authors       = ["Kevin Collignon"]
  spec.email         = ["usetwig@gmail.com"]
  spec.summary       = %q{The official ruby client for the Twig invoicing api.}
  spec.description   = %q{The official ruby client for the Twig invoicing api.}
  spec.homepage      = "https://www.usetwig.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", '~> 0.9'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_runtime_dependency 'faraday_middleware-multi_json'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end