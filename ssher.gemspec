# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ssher/version'

Gem::Specification.new do |spec|
  spec.name          = "ssher"
  spec.version       = SSHer::VERSION
  spec.authors       = ["Kavinder Dhaliwal"]
  spec.email         = ["kavinderd@gmail.com"]
  spec.summary       = %q{ssh into remote boxes}
  spec.description   = %q{ssh into remote servers and send officers to issue commands}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
  spec.add_runtime_dependency "net-ssh", '~> 2.9.1'
  spec.add_runtime_dependency 'net-ssh-shell'
end
