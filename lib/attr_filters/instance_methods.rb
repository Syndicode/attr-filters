# frozen_string_literal: true

module AttrFilters
  module InstanceMethods
    def filter!
      self.class._registered_filters.each_pair do |filter_name, attrs|
        filter = build_filter(filter_name)
        attrs.each do |attr|
          value = send(attr)
          send("#{attr}=", filter.call(value))
        end
      end
    end

    private

      def build_filter(filter_name)
        AttrFilters::Filters::LIST[filter_name]
      end
  end
end
