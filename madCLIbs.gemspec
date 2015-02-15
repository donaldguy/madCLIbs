# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mad_clibs/version'

Gem::Specification.new do |spec|
  spec.name          = "madCLIbs"
  spec.version       = MadClibs::VERSION
  spec.authors       = ["Donald Guy"]
  spec.email         = ["fawkes@mit.edu"]
  spec.summary       = %q{User-friendly fill-in-the-blank CLI forms (think HTML5 with placeholders) }
  spec.homepage      = "https://github.com/donaldguy/madCLIbs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
