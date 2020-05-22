# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-backwhite"
  spec.version       = "1.1.2"
  spec.authors       = ["andydevs"]
  spec.email         = ["akanshul97@gmail.com"]

  spec.summary       = "Backwhite theme as a jekyll package"
  spec.homepage      = "https://www.github.com/andydevs/jekyll-theme-backwhite#readme"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config)!i) }

  spec.add_runtime_dependency "jekyll"
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
