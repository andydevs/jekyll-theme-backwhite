# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-backwhite"
  spec.version       = "0.1.1"
  spec.authors       = ["andydevs"]
  spec.email         = ["akanshul97@gmail.com"]

  spec.summary       = "Backwhite theme as a jekyll package"
  spec.homepage      = "https://andydevs.github.io/jekyll-theme-backwhite"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 3.8"
  spec.add_runtime_dependency gem "jekyll-font-awesome-sass", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
end
