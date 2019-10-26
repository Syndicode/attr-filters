# frozen_string_literal: true

FakeModelKlass = Class.new

require "active_model"

module ActiveModel
  class Name
    def initialize(_klass, _namespace = nil, _name = nil)
      @name = FakeModelKlass
    end
  end
end
