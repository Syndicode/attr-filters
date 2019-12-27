# frozen_string_literal: true

module AttrFilters
  module Filters
    class LettersOnly < Base
      private

        def filter(value, options = {})
          return filter_letters_only(value) unless except_chars?(options)

          filter_letters_and_except_chars(value, options)
        end

        def filter_letters_only(value)
          value.gsub(/[^a-zA-Z\s]/i, "").squeeze(" ")
        end

        def except_chars?(options)
          options[:except]
        end

        def filter_letters_and_except_chars(value, options)
          except_chars = options[:except].map { |char| "\\" + char }.join

          value.gsub(/[^a-zA-Z\s#{except_chars}]/i, "").squeeze(" ")
        end
    end
  end
end
