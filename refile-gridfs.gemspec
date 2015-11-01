# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'refile/gridfs/version'

Gem::Specification.new do |spec|
  spec.name          = "refile-gridfs"
  spec.version       = Refile::Gridfs::VERSION
  spec.authors       = ["Jérémie Horhant"]
  spec.email         = ["jeremie.horhant@progralab.fr"]
  spec.summary       = %q{Gridfs backend for Refile}
  spec.homepage      = "https://github.com/Titinux/refile-gridfs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "refile", "~> 0.6.1"
  spec.add_dependency "mongo", "~> 2.1"

  spec.add_development_dependency "webmock", "~> 1.20.4"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "codeclimate-test-reporter"
end
