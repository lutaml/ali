# frozen_string_literal: true

module Ali
  class LicenseRef < Lutaml::Model::Serializable
    attribute :start_date, :date
    attribute :applies_to, :string
    attribute :uri, :string

    xml do
      root "license_ref"
      namespace "http://www.niso.org/schemas/ali/1.0/"

      map_attribute "start_date", to: :start_date
      map_attribute "applies_to", to: :applies_to
      map_content to: :uri
    end

    json do
      map "start_date", to: :start_date
      map "applies_to", to: :applies_to
      map "uri", to: :uri
    end
  end
end
