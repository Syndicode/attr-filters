# frozen_string_literal: true

require "bundler/setup"
require "attr_filters"

require_relative "./support/utils"
require_relative "./support/active_model/name" if active_model?

if active_record?
  require "sqlite3"
  require "active_record"
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
