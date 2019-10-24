# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::Utils do
  context ".extract_options" do
    it "should extract options" do
      attributes = [:email, :zip, trim: true, lowercase: true]

      _, options = AttrFilters::Utils.extract_options(attributes)

      expect(options).to eq(trim: true, lowercase: true)
    end

    it "should extract attributes" do
      attributes = [:email, :zip, trim: true, lowercase: true]

      attrs, = AttrFilters::Utils.extract_options(attributes)

      expect(attrs).to eq(%i[email zip])
    end

    it "should return empty hash of options if options don't exist" do
      attributes = %i[email zip]

      _, options = AttrFilters::Utils.extract_options(attributes)

      expect(options).to eq({})
    end

    it "should return empty array of attributes if attributes don't exist" do
      attributes = []

      attrs, = AttrFilters::Utils.extract_options(attributes)

      expect(attrs).to eq([])
    end
  end
end
