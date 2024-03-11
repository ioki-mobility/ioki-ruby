# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::UserEmail do
  it { is_expected.to define_attribute(:email_address).as(:string) }
  it { is_expected.to define_attribute(:newsletter).as(:boolean) }
  it { is_expected.to define_attribute(:receipt).as(:boolean) }

  describe 'omit_if_not_provided' do
    it 'does not serialize omitted attributes' do
      serialized = described_class.new(
        confirmed_email_address:   'confirmed@example.com',
        unconfirmed_email_address: 'unconfirmed@example.com'
      ).serialize(:create)

      expect(serialized).to eq(
        {
          confirmed_email_address:   'confirmed@example.com',
          unconfirmed_email_address: 'unconfirmed@example.com'
        }
      )
    end

    it 'serializes omitted attributes even when they are nil' do
      serialized = described_class.new(
        confirmed_email_address:   'confirmed@example.com',
        unconfirmed_email_address: 'unconfirmed@example.com',
        email_address:             nil
      ).serialize(:create)

      expect(serialized).to eq(
        {
          confirmed_email_address:   'confirmed@example.com',
          unconfirmed_email_address: 'unconfirmed@example.com',
          email_address:             nil
        }
      )
    end

    context 'when the action does not match' do
      context 'when attributes are explicitly specified' do
        let(:attributes) do
          {
            confirmed:     nil,
            email_address: nil,
            newsletter:    nil,
            receipt:       nil
          }
        end

        it 'serializes omitted attributes' do
          serialized = described_class.new(attributes).serialize(:read)

          expect(serialized).to eq(
            attributes
          )
        end
      end

      context 'when attributes are not explicitly specified' do
        it 'does not serialize anything' do
          serialized = described_class.new.serialize(:read)

          expect(serialized).to eq({})
        end
      end
    end
  end
end
