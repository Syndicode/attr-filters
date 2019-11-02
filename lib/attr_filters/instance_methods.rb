# frozen_string_literal: true

module AttrFilters
  module InstanceMethods
    def filter!
      self.class._registered_filters.each_pair do |filter_name, params|
        filter = build_filter(filter_name)
        params[:attributes].each do |attr|
          value = send(attr)
          send("#{attr}=", filter.call(value, params[:options]))
        end
      end
    end

    private

      def build_filter(filter_name)
        AttrFilters::Filters::LIST[filter_name]
      end
  end
end
