# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::Filters::Capitalize do
  it "should capitalize value" do
    filter = AttrFilters::Filters::Capitalize.new

    expect(filter.call("mike dou")).to eq("Mike dou")
  end
end
