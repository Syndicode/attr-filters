# frozen_string_literal: true

module AttrFilters
  module Filters
    autoload :Base, "attr_filters/filters/base"

    autoload :Trim, "attr_filters/filters/trim"
    autoload :Downcase, "attr_filters/filters/downcase"
    autoload :Upcase, "attr_filters/filters/upcase"
    autoload :Capitalize, "attr_filters/filters/capitalize"
    autoload :Squeeze, "attr_filters/filters/squeeze"
    autoload :LettersOnly, "attr_filters/filters/letters_only"
    autoload :NumbersOnly, "attr_filters/filters/numbers_only"
    autoload :Date, "attr_filters/filters/date"

    LIST = {
      trim: Trim.new,
      downcase: Downcase.new,
      upcase: Upcase.new,
      numbers_only: NumbersOnly.new,
      letters_only: LettersOnly.new,
      squeeze: Squeeze.new,
      capitalize: Capitalize.new,
      date: Date.new
    }.freeze
  end
end
