# frozen_string_literal: true

require "spec_helper"
require "date"

RSpec.describe AttrFilters::Filters::Date do
  it "should parse date using default format" do
    filter = AttrFilters::Filters::Date.new

    expect(filter.call("2019-11-02")).to eq(Date.new(2019, 11, 2))
  end

  it "should parse date using custom filter" do
    filter = AttrFilters::Filters::Date.new

    expect(filter.call("11-02-2019", "%m-%d-%Y")).to eq(Date.new(2019, 11, 2))
  end

  it "should do nothing if invalid value" do
    filter = AttrFilters::Filters::Date.new

    expect(filter.call(nil)).to eq(nil)
  end
end
