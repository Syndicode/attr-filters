# frozen_string_literal: true

module AttrFilters
  module Filters
    class Capitalize < Base
      private

        def filter(value)
          value.capitalize
        end
    end
  end
end
