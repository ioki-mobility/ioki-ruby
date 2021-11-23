# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'OpenApi schema definitions' do
  if API_SPECIFICATIONS[:platform_api]
    describe 'the platform_api definition' do
      models =
        Ioki::Model::Platform.
          constants.
          select { |constant| Ioki::Model::Platform.const_get(constant).is_a?(Class) }.
          reject { |constant| Ioki::Model::Platform.const_get(constant).unvalidated? }.
          map { |model| Ioki::Model::Platform.const_get(model) }

      (models - [Ioki::Model::Platform::Base]).each do |model|
        it "ensures #{model} matches the published API specifications" do
          expect(model).
            to match_open_api_definition(
              'platform_api',
              model,
              specification_scope: model.specification_scope,
              schema_path:         model.schema_path
            )
        end
      end
    end
  end

  # if API_SPECIFICATIONS[:passenger_api]
  #   describe 'the passenger_api definition' do
  #     unspecified_models = [
  #       Ioki::Model::Passenger::Base,
  #       Ioki::Model::Passenger::Bootstrap,
  #       Ioki::Model::Passenger::Cancellation,
  #       Ioki::Model::Passenger::Features,
  #       Ioki::Model::Passenger::RequestedPoint,
  #       Ioki::Model::Passenger::Route,
  #       Ioki::Model::Passenger::UserEmail,
  #       Ioki::Model::Passenger::UserPhoneNumber
  #     ]
  #     models =
  #       Ioki::Model::Passenger.
  #         constants.
  #         select { |constant| Ioki::Model::Passenger.const_get(constant).is_a?(Class) }.
  #         map { |model| Ioki::Model::Passenger.const_get(model) }

  #     (models - unspecified_models).each do |model|
  #       it "ensures #{model} matches the published API specifications" do
  #         expect(model).to match_open_api_definition('passenger_api', model)
  #       end
  #     end
  #   end
  # end

  # if API_SPECIFICATIONS[:passenger_api]
  #   describe 'the driver_api definition' do
  #     unspecified_models = [
  #       Ioki::Model::Driver::Base
  #     ]
  #     models =
  #       Ioki::Model::Driver.
  #         constants.
  #         select { |constant| Ioki::Model::Driver.const_get(constant).is_a?(Class) }.
  #         map { |model| Ioki::Model::Driver.const_get(model) }

  #     (models - unspecified_models).each do |model|
  #       it "ensures #{model} matches the published API specifications" do
  #         expect(model).to match_open_api_definition('driver_api', model)
  #       end
  #     end
  #   end
  # end
end
