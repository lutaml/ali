# frozen_string_literal: true

module Ali
  class LicenseRef < Lutaml::Model::Serializable
    attribute :start_date, :date
    attribute :applies_to, :string
    attribute :uri, :string

    xml do
      element "license_ref"
      namespace Namespace

      map_attribute "start_date", to: :start_date
      map_attribute "applies_to", to: :applies_to
      map_content to: :uri
    end

    key_value do
      map "start_date", to: :start_date
      map "applies_to", to: :applies_to
      map "uri", to: :uri
    end
  end
end
