# frozen_string_literal: true

module AttrFilters
  module Filters
    class Upcase < Base
      private

        def filter(value)
          value.upcase
        end
    end
  end
end
