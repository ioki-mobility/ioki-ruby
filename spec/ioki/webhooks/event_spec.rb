# frozen_string_literal: true

require 'spec_helper'
require 'time'

RSpec.describe Ioki::Webhooks::Event do
  subject(:event) do
    described_class.new params
  end

  let(:params) do
    {
      'id'          => "wev_#{rand(1E9)}",
      'type'        => 'webhook_event',
      'api_version' => '20201201',
      'provider_id' => "prv_#{rand(1E9)}",
      'event_type'  => 'user.created',
      'created_at'  => Time.now.iso8601,
      'data'        => {
        'id'   => "usr_#{rand(1E9)}",
        'type' => 'user'
      }
    }
  end

  it 'has a model attributes of the correct class' do
    expect(event.model).to be_a Ioki::Model::Webhooks::User
  end

  it 'has a model attributes with the correct id' do
    expect(event.model.id).to eq params['data']['id']
  end

  it 'can read the correct model_class_name' do
    expect(event.model_class_name).to eq('User')
  end

  it 'has the correct action' do
    expect(event.action).to eq 'created'
  end

  it 'has the correct id' do
    expect(event.id).to eq params['id']
  end

  it 'has the correct api_version' do
    expect(event.api_version).to eq params['api_version']
  end

  it 'has the correct provider_id' do
    expect(event.provider_id).to eq params['provider_id']
  end

  it 'has the correct created_at' do
    expect(event.created_at).to eq params['created_at']
  end

  it 'has the correct event_type' do
    expect(event.event_type).to eq params['event_type']
  end

  it 'has the correct data' do
    expect(event.data).to eq params['data']
  end
end
