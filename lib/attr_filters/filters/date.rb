# frozen_string_literal: true

module AttrFilters
  module Filters
    class Date < Base
      DEFAULT_FORMAT = "%Y-%m-%d"

      private

        def filter(value, format = DEFAULT_FORMAT)
          ::Date.strptime(value, format)
        end
    end
  end
end
