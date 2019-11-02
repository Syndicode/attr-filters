# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::Filters::Squeeze do
  it "should squeeze spaces" do
    filter = AttrFilters::Filters::Squeeze.new

    expect(filter.call("Mike  Dou")).to eq("Mike Dou")
  end

  it "should do nothing if invalid value" do
    filter = AttrFilters::Filters::Squeeze.new

    expect(filter.call(nil)).to eq(nil)
  end
end
