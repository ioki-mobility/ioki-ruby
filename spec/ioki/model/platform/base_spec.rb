# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::Model::Platform::Base do
  describe 'the class' do
    it 'inherits from Ioki::Model::Base' do
      expect(described_class < Ioki::Model::Base).to be_truthy
    end

    it 'defines attribute :id' do
      expect(described_class.attribute_definitions[:id]).to eq(
        on: :read, type: :string
      )
    end

    it 'defines attribute :type' do
      expect(described_class.attribute_definitions[:type]).to eq(
        on: :read, type: :string
      )
    end

    it 'defines attribute :created_at' do
      expect(described_class.attribute_definitions[:created_at]).to eq(
        on: :read, type: :date_time
      )
    end

    it 'defines attribute :updated_at' do
      expect(described_class.attribute_definitions[:updated_at]).to eq(
        on: :read, type: :date_time
      )
    end
  end
end
