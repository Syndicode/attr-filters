# frozen_string_literal: true

require "attr_filters/version"

module AttrFilters
  class UnknownFilterError < StandardError; end
  class UnknownAttributeError < StandardError; end

  autoload :Utils, "attr_filters/utils"

  AVAILABLE_FILTERS = {
    trim: ->(value) { value.strip },
    downcase: ->(value) { value.downcase },
    upcase: ->(value) { value.upcase },
    numbers_only: ->(value) { value.gsub(/^0-9/, "") },
    letters_only: ->(value) { value.gsub(/[^a-zA-Z\s]/i, "").squeeze(" ") },
    squeeze: ->(value) { value.squeeze(" ") },
    capitalize: ->(value) { value.capitalize }
  }.freeze

  module ClassMethods
    def filters(*attributes)
      @_registered_filters ||= {}

      attrs, filters = AttrFilters::Utils.extract_options(attributes)

      check_attributes!(attrs)
      check_filters!(filters.keys)

      filters.each_pair do |filter, _options|
        @_registered_filters[filter] ||= Set.new
        @_registered_filters[filter].merge(attrs)
      end
    end

    def _registered_filters
      @_registered_filters
    end

    private

    def check_attributes!(attrs)
      attrs.each do |attr|
        setter = "#{attr}="
        unknown_attribute!(setter) unless method_defined?(setter)
      end
    end

    def check_filters!(filters)
      filters.each do |filter|
        unknown_filter!(filter) unless AVAILABLE_FILTERS.key?(filter)
      end
    end

    def unknown_filter!(filter_name)
      raise(UnknownFilterError, "Unknown filter '#{filter_name}'. Available are [#{AVAILABLE_FILTERS.keys.join(', ')}]")
    end

    def unknown_attribute!(attr)
      raise UnknownAttributeError, "Unknown attribute #{attr}"
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def filter!
    self.class._registered_filters.each_pair do |filter_name, attrs|
      filter = build_filter(filter_name)
      attrs.each do |attr|
        # unless instance_variable_defined?(instance_attr)
        #   unknown_attribute!(instance_attr)
        # end

        value = send(attr)
        send("#{attr}=", filter.call(value))
      end
    end
  end

  private

  def build_filter(filter_name)
    AVAILABLE_FILTERS[filter_name]
  end
end
