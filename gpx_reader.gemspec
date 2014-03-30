# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gpx_reader/version'

Gem::Specification.new do |spec|
  spec.name          = "gpx_reader"
  spec.version       = GpxReader::VERSION
  spec.authors       = ["Nicolas Aguttes"]
  spec.email         = ["nicolas.aguttes@gmail.com"]
  spec.description   = %q{Gem to parse a gpx file or string}
  spec.summary       = %q{gpx reader}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "nokogiri", "1.6.1"

end
