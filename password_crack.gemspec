# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_crack/version'

Gem::Specification.new do |spec|
  spec.name          = "password_crack"
  spec.version       = PasswordCrack::VERSION
  spec.authors       = ["luax"]
  spec.email         = ["luax@qq.com"]

  spec.summary       = "crack password by dict"
  spec.description   = "it's easy to crack password by dict"
  spec.homepage      = "https://github.com/luaxlou/password_crack"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ['password_crack','password_is_week']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
