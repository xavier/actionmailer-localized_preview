# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_mailer/localized_preview/version'

Gem::Specification.new do |spec|
  spec.name          = "actionmailer-localized_preview"
  spec.version       = ActionMailer::LocalizedPreview::VERSION
  spec.authors       = ["Xavier Defrang"]
  spec.email         = ["xavier.defrang@gmail.com"]
  spec.summary       = %q{Extends ActionMailer::Preview to allow email previews in all available locales}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "actionmailer", "~> 4.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
