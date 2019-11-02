# frozen_string_literal: true

module AttrFilters
  module FiltersMacro
    def filters(*attributes)
      @_registered_filters ||= {}

      attrs, filters = AttrFilters::Utils.extract_options(attributes)

      check_attributes!(attrs)
      check_filters!(filters.keys)

      register_filters(filters, attrs)
    end

    def _registered_filters
      @_registered_filters || {}
    end

    private

      def register_filters(filters, attrs)
        filters.each_pair do |filter, options|
          @_registered_filters[filter] ||= { attributes: Set.new, options: options }
          @_registered_filters[filter][:attributes].merge(attrs)
        end
      end

      def check_attributes!(attrs)
        attrs.each do |attr|
          setter = "#{attr}="
          unknown_attribute!(setter) unless method_defined?(setter)
        end
      end

      def check_filters!(filters)
        filters.each do |filter|
          unknown_filter!(filter) unless AttrFilters::Filters::LIST.key?(filter)
        end
      end

      def unknown_filter!(filter_name)
        filters_list = AttrFilters::Filters::LIST.keys.join(", ")
        raise(AttrFilters::UnknownFilterError, "Unknown filter '#{filter_name}'. Available are [#{filters_list}]")
      end

      def unknown_attribute!(attr)
        raise AttrFilters::UnknownAttributeError, "Unknown attribute #{attr}"
      end
  end
end
