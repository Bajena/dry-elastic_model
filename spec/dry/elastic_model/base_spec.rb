require "spec_helper"

RSpec.describe Dry::ElasticModel::Base do
  class Foo < described_class
    field :text_field, :text
    field :keyword_field, :keyword
    field :date_field, :date
    field :long_field, :long
    field :double_field, :double
    field :boolean_field, :boolean
    field :ip_field, :ip
  end

  describe "mapping" do
    let(:expected_mapping) do
      {
        foo: {
          properties: {
            text_field: {
              type: "text",
              index: "not_analyzed"
            },
            keyword_field: {
              type: "keyword"
            },
            date_field: {
              type: "date",
              format: "strict_date_optional_time||epoch_millis"
            },
            long_field: {
              type: "long"
            },
            double_field: {
              type: "double"
            },
            boolean_field: {
              type: "boolean"
            },
            ip_field: {
              type: "ip"
            }
          }
        }
      }
    end

    it "is valid" do
      expect(Foo.mapping).to eq(expected_mapping)
    end
  end
end
