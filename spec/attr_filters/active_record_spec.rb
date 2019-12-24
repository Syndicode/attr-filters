# frozen_string_literal: true

require "spec_helper"

RSpec.describe "ActiveRecord integration using AttrFilters::ActiveModel", if: active_record? do
  context "attributes lazy loading" do
    it "should success add filter to an attribute" do
      ActiveRecord::Base.establish_connection(
        adapter: "sqlite3",
        database: ":memory:"
      )
      ActiveRecord::Base.connection.execute(%(CREATE TABLE IF NOT EXISTS users (name TEXT, age INT);))
      class User < ActiveRecord::Base
        include AttrFilters::ActiveModel

        filters :name, trim: true
      end

      user = User.new(name: "  Mike Dou")
      user.valid?

      expect(user.name).to eq("Mike Dou")
    end
  end
end
