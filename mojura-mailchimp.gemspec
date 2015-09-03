# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mojura/lib/version'

Gem::Specification.new do |spec|
  spec.name          = "mojura-mailchimp"
  spec.version       = Mojura::Mailchimp::VERSION
  spec.authors       = ["Taco Jan Osinga"]
  spec.email         = ["info@osingasoftware.nl"]
  spec.summary       = "This gem adds MailChimp functionality to your Mojura project."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "mojura", "~> 0.15.0"
  spec.add_development_dependency "rest-client"
end
