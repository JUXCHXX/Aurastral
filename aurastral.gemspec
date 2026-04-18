# frozen_string_literal: true

require_relative "lib/aurastral/version"

Gem::Specification.new do |spec|
  spec.name          = "aurastral"
  spec.version       = Aurastral::VERSION
  spec.authors       = ["Aurastral"]
  spec.email         = ["info@aurastral.dev"]
  spec.summary       = "Generate personalized horoscopes using Groq API"
  spec.description   = "A CLI tool that generates personalized horoscopes using the free Groq API with llama-3.3-70b-versatile model"
  spec.homepage      = "https://github.com/aurastral/aurastral"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.files         = Dir["lib/**/*.rb"] + Dir["bin/*"] + Dir["spec/**/*"] + ["Gemfile", "README.md", ".env.example"]
  spec.bindir        = "bin"
  spec.executables   = ["aurastral"]

  spec.add_runtime_dependency "faraday", "~> 2.7"
  spec.add_runtime_dependency "dotenv", "~> 3.0"
  spec.add_runtime_dependency "tty-prompt", "~> 0.23"
  spec.add_runtime_dependency "tty-box", "~> 0.7"
  spec.add_runtime_dependency "tty-spinner", "~> 0.9"
  spec.add_runtime_dependency "pastel", "~> 0.8"

  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "webmock", "~> 3.18"
end
