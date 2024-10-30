# frozen_string_literal: true

module Ali
  class FreeToRead < Lutaml::Model::Serializable
    attribute :start_date, :date
    attribute :end_date, :date

    xml do
      root "free_to_read"
      namespace "http://www.niso.org/schemas/ali/1.0/"

      map_attribute "start_date", to: :start_date
      map_attribute "end_date", to: :end_date
    end

    json do
      map "start_date", to: :start_date
      map "end_date", to: :end_date
    end
  end
end
