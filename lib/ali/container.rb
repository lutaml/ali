# frozen_string_literal: true

module Ali
  # The container is only used in the case of JSON and is not from the NISO ALI
  # spec. The NISO ALI contains multiple JSON examples stored in object form
  # that assumes an object container to parse.
  class Container < Lutaml::Model::Serializable
    attribute :free_to_read, FreeToRead, collection: true
    attribute :license_ref, LicenseRef, collection: true

    xml do
      root "ali-container"
      namespace "http://www.niso.org/schemas/ali/1.0/"

      map_element "free_to_read", to: :free_to_read
      map_element "license_ref", to: :license_ref
    end

    json do
      map "free_to_read", to: :free_to_read
      map "license_ref", to: :license_ref
    end
  end
end
