# frozen_string_literal: true

module Ali
  class FreeToRead < Lutaml::Model::Serializable
    attribute :start_date, :date
    attribute :end_date, :date

    xml do
      element "free_to_read"
      namespace Namespace

      map_attribute "start_date", to: :start_date
      map_attribute "end_date", to: :end_date
    end

    key_value do
      map "start_date", to: :start_date
      map "end_date", to: :end_date
    end
  end
end
