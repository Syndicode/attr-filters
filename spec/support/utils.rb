# frozen_string_literal: true

def active_model?
  AttrFilters::Utils.satisfied_spec?("activemodel")
end
