# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::Model::Platform::Base do
  describe 'the class' do
    it 'inherits from Ioki::Model::Base' do
      expect(described_class < Ioki::Model::Base).to be_truthy
    end
  end
end
