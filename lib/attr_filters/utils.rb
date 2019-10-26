# frozen_string_literal: true

module AttrFilters
  module Utils
    def self.extract_options(attrs)
      last = attrs.last
      options = last.is_a?(::Hash) ? last : {}
      [attrs[0..-2], options]
    end

    def self.satisfied_spec?(spec_name)
      Gem.loaded_specs.key?(spec_name)
    end
  end
end
