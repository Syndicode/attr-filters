# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::Filters::Capitalize do
  it "should capitalize value" do
    filter = AttrFilters::Filters::Capitalize.new

    expect(filter.call("mike dou")).to eq("Mike dou")
  end

  it "should do nothing if invalid value" do
    filter = AttrFilters::Filters::Capitalize.new

    expect(filter.call(nil)).to eq(nil)
  end
end
