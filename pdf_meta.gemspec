# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdf_meta/version'

Gem::Specification.new do |spec|
  spec.name          = "pdf_meta"
  spec.version       = PDFMeta::VERSION
  spec.authors       = ["Adam Carlile"]
  spec.email         = ["adam.carlile@boardintelligence.co.uk"]

  spec.summary       = %q{A gem for reading file data from poppler pdfinfo}
  spec.homepage      = "http://github.com/boardiq/pdf_meta"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "virtus"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
