# frozen_string_literal: true

require_relative "../lib/ali"
require "rspec/matchers"
require "canon"
require "canon/rspec_matchers"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Lutaml::Model::Config.configure do |config|
  config.xml_adapter_type = :nokogiri
end

Canon::RSpecMatchers.configure do |config|
  # Use spec_friendly profile which ignores comments and formatting differences
  # that don't affect semantic equivalence
  config.xml_match_profile = :spec_friendly

  # Only show normative (semantically significant) diffs, hide informational
  # config.diff_mode = :normative
end
