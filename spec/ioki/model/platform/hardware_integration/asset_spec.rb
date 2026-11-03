# frozen_string_literal: true

RSpec.describe Ioki::Model::Platform::HardwareIntegration::Asset do
  describe 'vendor_data' do
    {
      'easymile' => Ioki::Model::Platform::HardwareIntegration::VendorData::Easymile,
      'iav'      => Ioki::Model::Platform::HardwareIntegration::VendorData::Iav,
      'mobileye' => Ioki::Model::Platform::HardwareIntegration::VendorData::Mobileye,
      'navya'    => Ioki::Model::Platform::HardwareIntegration::VendorData::Navya,
      'we_ride'  => Ioki::Model::Platform::HardwareIntegration::VendorData::WeRide
    }.each do |asset_type, vendor_data_class|
      it "is a #{vendor_data_class.name.demodulize} for a #{asset_type} asset" do
        asset = described_class.new(
          asset_type:  asset_type,
          vendor_data: { type: "hardware_integration/vendor_data/#{asset_type}", vendor_id: 'V1' }
        )

        expect(asset.vendor_data).to be_a(vendor_data_class)
        expect(asset.vendor_data.vendor_id).to eq('V1')
      end
    end

    it 'gives access to the WeRide fields' do
      asset = described_class.new(
        vendor_data: {
          type:      'hardware_integration/vendor_data/we_ride',
          vendor_id: 'V1',
          base_url:  'https://we-ride.example.com',
          token:     'TOKEN',
          channel:   'ioki'
        }
      )

      expect(asset.vendor_data).to have_attributes(
        vendor_id: 'V1', base_url: 'https://we-ride.example.com', token: 'TOKEN', channel: 'ioki'
      )
    end
  end

  describe 'vehicle' do
    subject(:asset) { described_class.new vehicle: { type: 'vehicle', id: 'veh_1' } }

    it { is_expected.to have_attributes vehicle: be_a(Ioki::Model::Platform::Vehicle) }
    it { is_expected.to have_attributes vehicle: have_attributes(id: 'veh_1') }
  end

  describe 'features' do
    subject(:asset) do
      described_class.new features: {
        type:                          'feature_set/hardware_integration_asset_features',
        door_open_requires_attendance: true
      }
    end

    it { is_expected.to have_attributes features: be_a(Ioki::Model::Platform::FeatureSet::HardwareIntegrationAssetFeatures) }
    it { is_expected.to have_attributes features: have_attributes(door_open_requires_attendance: true) }
  end

  it { is_expected.to define_attribute(:id).as(:string) }
  it { is_expected.to define_attribute(:type).as(:string) }
  it { is_expected.to define_attribute(:active).as(:boolean) }
  it { is_expected.to define_attribute(:asset_type).as(:string) }
  it { is_expected.to define_attribute(:name).as(:string) }
  it { is_expected.to define_attribute(:provider_id).as(:string) }
  it { is_expected.to define_attribute(:state).as(:string) }
end
