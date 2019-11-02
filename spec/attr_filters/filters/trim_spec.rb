# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::Filters::Trim do
  it "should trim spaces before" do
    filter = AttrFilters::Filters::Trim.new

    expect(filter.call("  Mike Dou")).to eq("Mike Dou")
  end

  it "should trim spaces after" do
    filter = AttrFilters::Filters::Trim.new

    expect(filter.call("Mike Dou  ")).to eq("Mike Dou")
  end

  it "should trim spaces both" do
    filter = AttrFilters::Filters::Trim.new

    expect(filter.call("  Mike Dou  ")).to eq("Mike Dou")
  end

  it "should do nothing if invalid value" do
    filter = AttrFilters::Filters::Trim.new

    expect(filter.call(nil)).to eq(nil)
  end
end
