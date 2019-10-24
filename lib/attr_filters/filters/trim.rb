# frozen_string_literal: true

module AttrFilters
  module Filters
    class Trim < Base
      private

        def filter(value)
          value.strip
        end
    end
  end
end
