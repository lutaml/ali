# frozen_string_literal: true

require "spec_helper"

RSpec.describe Ali::Container do
  context "json" do
    let(:parsed) do
      described_class.from_json(content)
    end
    let(:generated) do
      parsed.to_json(pretty: true)
    end

    context "with start_date" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "license_ref": {
              "start_date": "2014-04-04",
              "uri": "http://creativecommons.org/licenses/by/3.0/"
            }
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end

    context "without start_date" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "license_ref": "http://creativecommons.org/licenses/by/3.0/"
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end

    context "with multiple instances" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "license_ref": [
              {
                "start_date": "2014-04-04",
                "uri": "http://creativecommons.org/licenses/by/3.0/"
              },
              {
                "start_date": "2015-04-04",
                "uri": "http://creativecommons.org/licenses/by/4.0/"
              }
            ]
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end

    context "with applies_to" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "license_ref": [
              {
                "start_date": "2015-04-04",
                "applies_to": "https://doi.org/10.15223/asf-profile",
                "uri": "https://doi.org/10.15223/policy-005"
              },
              {
                "start_date": "2015-04-04",
                "applies_to": "https://doi.org/10.15223/asf-profile",
                "uri": "https://doi.org/10.15223/policy-025"
              }
            ]
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end
  end
end
