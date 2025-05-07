# frozen_string_literal: true

require 'spec_helper'
require 'open_api'

RSpec.describe 'OpenApi schema definitions' do
  OpenApi::Specification.all.each do |specification|
    describe specification.name do
      if specification.file_exists?
        specification.models.each do |model|
          describe model.ioki_model do
            it 'has an OpenApi schema' do
              expect(model.schema).not_to be_nil, "expected to find schema definition: #{model.schema_path}"
            end

            it 'has all specified OpenApi attributes' do
              expect(model.unspecified_model_attributes).to(
                be_empty,
                "expected to have the following attributes: #{model.unspecified_model_attributes}"
              )
            end

            it 'has no attributes which are not in the OpenApi specification' do
              expect(model.undefined_schema_attributes).to(
                be_empty,
                "expected not to have the following attributes: #{model.undefined_schema_attributes}"
              )
            end

            it 'has no deprecated OpenApi attributes' do
              expect(model.deprecated_model_attributes).to(
                be_empty,
                "expected not to have the following deprecated attributes: #{model.deprecated_model_attributes}"
              )
            end
          end
        end
      else
        skip 'OpenApi specification file not found'
      end
    end
  end
end
