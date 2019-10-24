# frozen_string_literal: true

module AttrFilters
  module Filters
    class Downcase < Base
      private

        def filter(value)
          value.downcase
        end
    end
  end
end
