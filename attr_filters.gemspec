# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "attr_filters/version"

Gem::Specification.new do |spec|
  spec.name          = "attr_filters"
  spec.version       = AttrFilters::VERSION
  spec.authors       = ["Anton Holovko", "Syndicode LLC"]
  spec.email         = ["anton.holovko.b@gmail.com", "info@syndicode.com"]

  spec.summary       = "Light weight gem for filtering PORO (Plain Old Ruby Objects) attributes with zero dependencies."
  spec.description   = "Light weight gem for filtering PORO (Plain Old Ruby Objects) attributes with zero dependencies."
  spec.homepage      = "https://github.com/Syndicode/attr-filters"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Syndicode/attr-filters"
    spec.metadata["changelog_uri"] = "https://github.com/Syndicode/attr-filters"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.75.0"
end
