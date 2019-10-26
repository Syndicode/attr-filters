# frozen_string_literal: true

module AttrFilters
  module ActiveModel
    if AttrFilters::Utils.satisfied_spec?("activemodel")
      require "active_model"
      require "active_model/validations/filters_validator"
    end

    def self.included(base)
      base.include AttrFilters
      base.extend Macro
      base.init
    end

    module Macro
      def init
        before_validation :filter! if respond_to?(:before_validation)
      end
    end
  end
end
