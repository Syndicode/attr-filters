# frozen_string_literal: true

module AttrFilters
  module Filters
    class Squeeze < Base
      private

        def filter(value)
          value.squeeze(" ")
        end
    end
  end
end
