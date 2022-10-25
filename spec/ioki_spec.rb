# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki do
  it 'has a version number' do
    expect(Ioki::VERSION).not_to be_nil
  end

  it 'is a module carrying a config' do
    expect(described_class.config).to be_a(Ioki::Configuration)
  end

  it 'is a module that can yield the config for initializers to be changed' do
    tmp_value = described_class.config.api_base_url

    expect do
      described_class.configure do |_cfg|
        described_class.config.api_base_url = 'foobar'
      end
    end.to change { described_class.config.api_base_url }.to('foobar')
  ensure
    described_class.config.api_base_url = tmp_value
  end
end
