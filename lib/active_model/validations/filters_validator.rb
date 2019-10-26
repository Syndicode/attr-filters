# frozen_string_literal: true

module ActiveModel
  module Validations
    class FiltersValidator < ActiveModel::EachValidator
      def initialize(options)
        filters = options.slice(*AttrFilters::Filters::LIST.keys)
        model_class = options[:class]
        model_class.filters(*options[:attributes], filters)
        super(options)
      end

      def validate_each(_record, _attribute, _value); end
    end
  end
end
