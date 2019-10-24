# frozen_string_literal: true

module AttrFilters
  module Filters
    class LettersOnly < Base
      private

        def filter(value)
          value.gsub(/[^a-zA-Z\s]/i, "").squeeze(" ")
        end
    end
  end
end
