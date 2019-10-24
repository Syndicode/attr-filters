# frozen_string_literal: true

module AttrFilters
  module Filters
    class NumbersOnly < Base
      private

        def filter(value)
          value.tr("^0-9", "")
        end
    end
  end
end
