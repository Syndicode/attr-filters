# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::Filters::LettersOnly do
  it "should remove all non letter characters" do
    filter = AttrFilters::Filters::LettersOnly.new

    expect(filter.call("Mike 123 - Dou!")).to eq("Mike Dou")
  end
end
