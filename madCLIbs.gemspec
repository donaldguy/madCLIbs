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
  spec.description   = <<-EOS
  Seeks to mimic the familiar UX of HTML5 form elements, with placeholder attributes,
  in an ANSI-compatible terminal.

  Allows a program to present a line with one or more "blanks" which can be edited and moved between
  at will (with tab or up & down arrow keys). On new line, returns the values of the blanks (treating
  placeholders as a default values if no editing occured)
  EOS
  spec.homepage      = "https://github.com/donaldguy/madCLIbs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "term-ansicolor", "~> 1.1"
  spec.add_dependency "activesupport", "~> 3"

  spec.add_development_dependency "bundler", "~> 1.6"
end
