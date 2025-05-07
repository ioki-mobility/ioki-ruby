# frozen_string_literal: true

require 'spec_helper'
require 'open_api'

RSpec.describe OpenApi do
  subject(:open_api_model) { OpenApi::Model.new(specification, Ioki::Model::Platform::Example) }

  let!(:model_definition) do
    <<~RUBY
      module Ioki
        module Model
          module Platform
            class Example < Base
              attribute :regular_attribute, on: :read, type: :string
              attribute :deprecated_attribute, on: :read, type: :string
            end
          end
        end
      end
    RUBY
  end

  let!(:expected_repaired_model_definition) do
    <<~RUBY
      module Ioki
        module Model
          module Platform
            class Example < Base
              attribute :new_attribute, type: :string, on: [:create, :read, :update]
              attribute :regular_attribute, on: :read, type: :string
              # attribute :deprecated_attribute, on: :read, type: :string
            end
          end
        end
      end
    RUBY
  end

  let!(:raw_specification_json) do
    <<~JSON
      {
        "openapi": "3.1.0",
        "components": {
          "schemas": {
            "platform_api--v20210101--example": {
              "type": "object",
              "properties": {
                "regular_attribute": {
                  "type": "string",
                  "description": "Regular unchanged attribute of the example"
                },
                "new_attribute": {
                  "type": "string",
                  "description": "New attribute of the example"
                }
              },
              "title": "PlatformApi::V20210101::Example"
            }
          }
        }
      }
    JSON
  end

  let!(:specification) do
    OpenApi::Specification.new('platform', 'platform_api--v20210101')
  end

  let!(:specification_json) { JSON.parse(raw_specification_json) }

  let(:model_file_path) { 'lib/ioki/model/platform/example.rb' }

  before do
    allow(File).to receive(:open).with(model_file_path).and_return(StringIO.new(model_definition))
    allow(File).to receive(:write)
    allow(JSON).to receive(:parse).and_return(specification_json)
    eval(model_definition)
  end

  describe '#repair' do
    it 'adds missing attributes and comments out deprecated attributes' do
      expect(File).to receive(:write).with(model_file_path, expected_repaired_model_definition)
      subject.repair
    end
  end
end
