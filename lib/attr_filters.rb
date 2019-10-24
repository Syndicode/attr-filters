# frozen_string_literal: true

require "attr_filters/version"

module AttrFilters
  class UnknownFilterError < StandardError; end
  class UnknownAttributeError < StandardError; end

  autoload :Utils, "attr_filters/utils"
  autoload :FiltersMacro, "attr_filters/filters_macro"
  autoload :InstanceMethods, "attr_filters/instance_methods"
  autoload :Filters, "attr_filters/filters"

  def self.included(base)
    base.extend(FiltersMacro)
    base.include(InstanceMethods)
  end
end
