# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'OpenApi schema definitions' do
  if API_SPECIFICATIONS[:platform_api]
    describe 'the platform_api definition' do
      Ioki::Model::Platform::Base.descendants.reject(&:unvalidated?).each do |model|
        it "ensures #{model} matches the published API specifications" do
          expect(model).to match_open_api_definition('platform_api', model)
        end
      end
    end
  end

  if API_SPECIFICATIONS[:passenger_api]
    describe 'the passenger_api definition' do
      Ioki::Model::Passenger::Base.descendants.reject(&:unvalidated?).each do |model|
        it "ensures #{model} matches the published API specifications" do
          expect(model).to match_open_api_definition('passenger_api', model)
        end
      end
    end
  end

  if API_SPECIFICATIONS[:driver_api]
    describe 'the driver_api definition' do
      Ioki::Model::Driver::Base.descendants.reject(&:unvalidated?).each do |model|
        it "ensures #{model} matches the published API specifications" do
          expect(model).to match_open_api_definition('driver_api', model)
        end
      end
    end
  end

  if API_SPECIFICATIONS[:webhooks_api]
    describe 'the webhooks_api definition' do
      Ioki::Model::Webhooks::Base.descendants.each do |model|
        it "ensures #{model} matches the published API specifications" do
          expect(model).to match_open_api_definition('webhooks_api', model)
        end
      end
    end
  end
end
