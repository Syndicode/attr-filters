# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::Filters::LettersOnly do
  it "should remove all non letter characters" do
    filter = AttrFilters::Filters::LettersOnly.new

    expect(filter.call("Mike 123 - Dou!")).to eq("Mike Dou")
  end

  it "should do nothing if invalid value" do
    filter = AttrFilters::Filters::LettersOnly.new

    expect(filter.call(nil)).to eq(nil)
  end

  context "when :expect option used" do
    context "with one excepting character" do
      it "should not remove special character" do
        filter = described_class.new

        expect(filter.call("O'Connor", except: %w['])).to eq("O'Connor")
      end
    end

    context "with several excepting characters" do
      it "should not remove special characters" do
        filter = described_class.new

        expect(filter.call("Mi'ke 123 - Dou!", except: %w[' - !])).to(
          eq("Mi'ke - Dou!")
        )
      end
    end
  end
end
