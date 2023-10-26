# frozen_string_literal: true

require 'mail'
require 'ioki/mailing/mailer'
require 'ioki/mailing/message'

RSpec.describe Ioki::Mailing::Mailer do
  subject { described_class.new.deliver!(mail) }

  let(:platform_client) do
    Ioki::Client.new(Ioki::Configuration.new, Ioki::PlatformApi)
  end

  context 'with valid options' do
    let(:mail) do
      Mail::Message.new.tap do |message|
        message.ioki_options = {
          provider_id:      'prv_1',
          platform_client:  platform_client,
          delivery_context: 'registration'
        }
      end
    end

    it 'calls the API to deliver an email' do
      without_partial_double_verification do
        expect(platform_client).to receive(:create_email_delivery).with(
          have_attributes(id: 'prv_1'),
          have_attributes(delivery_context: 'registration', user_id: nil)
        )
      end

      subject
    end
  end

  context 'with user_id' do
    let(:mail) do
      Mail::Message.new.tap do |message|
        message.ioki_options = {
          provider_id:      'prv_1',
          platform_client:  platform_client,
          delivery_context: 'standard',
          user_id:          'usr_1'
        }
      end
    end

    it 'calls the API to deliver an email' do
      without_partial_double_verification do
        expect(platform_client).to receive(:create_email_delivery).with(
          have_attributes(id: 'prv_1'),
          have_attributes(delivery_context: 'standard', user_id: 'usr_1')
        )
      end

      subject
    end
  end

  context 'with invalid options' do
    let(:mail) { Mail::Message.new }

    it 'raises an error' do
      expect do
        subject
      end.to raise_error ArgumentError
    end
  end
end
