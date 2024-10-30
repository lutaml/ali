# frozen_string_literal: true

require_relative "ali/version"
require "lutaml/model"

module Ali
  class Error < StandardError; end

  # Your code goes here...
end

require_relative "ali/free_to_read"
require_relative "ali/license_ref"
require_relative "ali/container"
