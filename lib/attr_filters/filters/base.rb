# frozen_string_literal: true

module AttrFilters
  module Filters
    class Base
      def call(value)
        filter(value)
      end
    end
  end
end
