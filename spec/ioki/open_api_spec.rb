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
              attribute :removed_attribute, on: :read, type: :string
              attribute :deprecated_attribute, on: :read, type: :string
              attribute :unvalidated_attribute,
                        on:             :create,
                        omit_if_nil_on: [:create],
                        type:           :string,
                        unvalidated:    true
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
              attribute :new_one_of_attribute, type: :object, on: [:create, :read, :update], class_name: 'Other'
              attribute :new_any_of_attribute, type: [:string, :boolean], on: [:create, :read, :update]
              attribute :new_attribute, type: :string, on: [:create, :read, :update]
              attribute :regular_attribute, on: :read, type: :string
              # attribute :removed_attribute, on: :read, type: :string
              deprecated_attribute :deprecated_attribute, on: :read, type: :string
              attribute :unvalidated_attribute,
                        on:             :create,
                        omit_if_nil_on: [:create],
                        type:           :string,
                        unvalidated:    true
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
                },
                "new_any_of_attribute": {
                  "anyOf": [ { "type": "string" }, { "type": "boolean" } ],
                  "description": "New attribute of the example"
                },
                "new_one_of_attribute": {
                  "oneOf": [ { "type": "null" }, { "$ref": "#/components/schemas/platform_api--v20210101--other" } ],
                  "description": "New attribute of the example"
                },
                "deprecated_attribute": {
                  "type": "string",
                  "description": "Deprecated attribute of the example",
                  "deprecated": true
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
    # unset Ioki::Model::Platform::Example constant:
    Ioki::Model::Platform.send(:remove_const, :Example) if Ioki::Model::Platform.const_defined?(:Example)
    eval(model_definition)
  end

  describe '#unspecified_model_attributes' do
    it 'returns the attributes that are not specified in the OpenAPI spec' do
      expect(subject.unspecified_model_attributes).to eq([:removed_attribute])
    end
  end

  describe '#deprecated_model_attributes' do
    it 'returns the attributes that are not deprecated in the OpenAPI spec' do
      expect(subject.deprecated_model_attributes).to eq([:deprecated_attribute])
    end
  end

  describe '#undefined_schema_attributes' do
    it 'returns the attributes that are not defined in the OpenAPI spec' do
      expect(subject.undefined_schema_attributes).to eq([:new_attribute, :new_any_of_attribute, :new_one_of_attribute])
    end
  end

  describe '#repair' do
    it 'adds missing attributes and comments out deprecated attributes' do
      allow(File).to receive(:write) do |path, ruby_code|
        expect(path).to eq(model_file_path)
        if ruby_code != expected_repaired_model_definition
          puts "\nExpected code:\n\n"
          puts expected_repaired_model_definition
          puts "\nActual code:\n\n"
          puts ruby_code
        end
        aggregate_failures 'testing generated ruby code' do
          expect(ruby_code).to include('attribute :new_attribute, type: :string, on: [:create, :read, :update]')
          expect(ruby_code).to include('attribute :new_any_of_attribute, type: [:string, :boolean], on: [:create, :read, :update]')
          expect(ruby_code).to include('# attribute :removed_attribute, on: :read, type: :string')
          expect(ruby_code).to include('deprecated_attribute :deprecated_attribute, on: :read, type: :string')
          expect(ruby_code).not_to include('# deprecated_attribute :deprecated_attribute')
          expect(ruby_code).not_to include('# attribute :unvalidated_attribute')
          expect(ruby_code).to eq(expected_repaired_model_definition)
        end
      end
      subject.repair
    end
  end
end
