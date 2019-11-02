# frozen_string_literal: true

require "spec_helper"

RSpec.describe AttrFilters::ActiveModel, if: active_model? do
  context "integrate #filter! to Validations" do
    it "should call #filter! method before validation" do
      form_class = Struct.new(:user_name) do
        include ActiveModel::Validations
        include ActiveModel::Validations::Callbacks
        include AttrFilters::ActiveModel

        validates :user_name, presence: true
        filters :user_name, trim: true
      end

      user = form_class.new("Mike Dou")

      expect(user).to receive(:filter!)

      user.valid?
    end

    it "should not call #filter! method before validation" do
      form_class = Struct.new(:user_name) do
        include ActiveModel::Validations
        include AttrFilters::ActiveModel

        validates :user_name, presence: true
        filters :user_name, trim: true
      end

      user = form_class.new("Mike Dou")

      expect(user).not_to receive(:filter!)

      user.valid?
    end
  end

  context "integrate filters into validates API" do
    it "should call trim filter" do
      form_class = Struct.new(:user_name) do
        include ActiveModel::Validations
        include ActiveModel::Validations::Callbacks
        include AttrFilters::ActiveModel

        validates :user_name, presence: true, filters: { trim: true }
      end

      user = form_class.new("Mike Dou")

      expect(AttrFilters::Filters::LIST[:trim]).to receive(:filter).with("Mike Dou")

      user.valid?
    end

    it "should call date filter with options" do
      form_class = Struct.new(:user_name) do
        include ActiveModel::Validations
        include ActiveModel::Validations::Callbacks
        include AttrFilters::ActiveModel

        validates :user_name, presence: true, filters: { date: "%m-%d-%Y" }
      end

      user = form_class.new("Mike Dou")

      expect(AttrFilters::Filters::LIST[:date]).to receive(:filter).with("Mike Dou", "%m-%d-%Y")

      user.valid?
    end

    it "should filter model attributes" do
      form_class = Struct.new(:user_name) do
        include ActiveModel::Validations
        include ActiveModel::Validations::Callbacks
        include AttrFilters::ActiveModel

        validates :user_name, presence: true, filters: { trim: true, squeeze: true }
      end

      user = form_class.new("  Mike   Dou  ")

      user.valid?

      expect(user.user_name).to eq("Mike Dou")
    end
  end
end
