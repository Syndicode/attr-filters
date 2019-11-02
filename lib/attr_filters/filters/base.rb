# frozen_string_literal: true

module AttrFilters
  module Filters
    class Base
      def call(value, *options)
        filter(value, *options.reject { |opt| opt == true })
      rescue ::StandardError # rubocop:disable Lint/HandleExceptions
      end
    end
  end
end
