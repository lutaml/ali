# frozen_string_literal: true

require "spec_helper"

RSpec.describe Ali::FreeToRead do
  context "xml" do
    let(:parsed) do
      described_class.from_xml(content)
    end
    let(:generated) do
      parsed.to_xml(pretty: true, declaration: true, encoding: "utf-8")
    end

    context "with start_date and no end_date" do
      let(:content) do
        <<~CONTENT
          <free_to_read start_date="2015-02-03"/>
        CONTENT
      end

      it "generates valid ALI XML" do
        expect(generated).to be_analogous_with(content)
      end
    end

    context "with start_date and end_date" do
      let(:content) do
        <<~CONTENT
          <free_to_read xmlns="http://www.niso.org/schemas/ali/1.0/"
            start_date="2014-01-01"
            end_date="2014-12-31"/>
        CONTENT
      end

      it "generates valid ALI XML" do
        expect(generated).to be_analogous_with(content)
      end
    end

    context "with only end_date" do
      let(:content) do
        <<~CONTENT
          <free_to_read xmlns="http://www.niso.org/schemas/ali/1.0/"
            end_date="2014-12-31"/>
        CONTENT
      end

      it "generates valid ALI XML" do
        expect(generated).to be_analogous_with(content)
      end
    end
  end

  context "json" do
    let(:parsed) do
      described_class.from_json(content)
    end
    let(:generated) do
      parsed.to_json(pretty: true)
    end

    context "without any date" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "free_to_read": true
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end

    context "with start_date" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "free_to_read": {
              "start_date": "2013-02-03"
            }
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end

    context "with end_date" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "free_to_read": {
              "end_date": "2013-10-03"
            }
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end

    context "with start_date and end_date" do
      let(:content) do
        <<~CONTENT
          {
            "@context": "http://www.niso.org/schemas/ali/1.0.1/jsonld.json",
            "free_to_read": {
              "start_date": "2013-02-03",
              "end_date": "2013-10-03"
            }
          }
        CONTENT
      end

      it "generates valid ALI JSON" do
        expect(generated).to eq(content)
      end
    end
  end
end
