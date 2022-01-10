# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::ServiceCredit do
  subject(:service_credit) do
    described_class.new(
      id:      'scr_1',
      admin:   { id: 'adm_1' },
      charges: [{ id: 'scc_1' }, { id: 'scc_2' }]
    )
  end

  describe '#admin attribute' do
    it 'is an Ioki::Model::Platform::Admin' do
      expect(service_credit.admin).to be_a(Ioki::Model::Platform::Admin)
    end
  end

  describe '#charges attribute' do
    it 'is an array' do
      expect(service_credit.charges).to be_a(Array)
    end

    it 'contains 2 entries' do
      expect(service_credit.charges.count).to eq(2)
    end

    it 'consists of two Ioki::Model::Platform::ServiceCreditCharge objects' do
      expect(service_credit.charges[0]).to be_a(Ioki::Model::Platform::ServiceCreditCharge)
      expect(service_credit.charges[1]).to be_a(Ioki::Model::Platform::ServiceCreditCharge)
    end
  end
end
