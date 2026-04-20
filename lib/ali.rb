# frozen_string_literal: true

require "lutaml/model"

module Ali
  class Error < StandardError; end

  autoload :FreeToRead, "ali/free_to_read"
  autoload :LicenseRef, "ali/license_ref"
  autoload :Container, "ali/container"
  autoload :Namespace, "ali/namespace"
  autoload :Version, "ali/version"
end
