# frozen_string_literal: true

RSpec.describe Ioki::Model::Operator::TaskList do
  let(:task_list) do
    task_list_model.new(
      {
        start_location: start_location_params,
        end_location:   end_location_params
      }
    )
  end

  let(:start_location_params) do
    {
      'id'            => 'sta_0b1891bd-96b2-408f-971b-2e189ae8db14',
      'created_at'    => Time.now,
      'updated_at'    => Time.now,
      'type'          => start_location_type,
      'location_name' => 'HQ',
      'lat'           => 49,
      'lng'           => 8
    }
  end

  let(:end_location_params) do
    {
      'id'            => 'end_1b1891bd-96b2-408f-971b-3a199ae8db56',
      'created_at'    => Time.now,
      'updated_at'    => Time.now,
      'type'          => end_location_type,
      'location_name' => 'Depot',
      'lat'           => 49.5,
      'lng'           => 8.5
    }
  end

  shared_examples 'creates the task_list with the correct attributes' do
    it 'creates the task_list with the correct start_location attributes' do
      expect(task_list.start_location.attributes[:id]).to eq(start_location_params['id'])
      expect(task_list.start_location.attributes[:type]).to eq(start_location_params['type'])
      expect(task_list.start_location.attributes[:location_name]).to eq(start_location_params['location_name'])
      expect(task_list.start_location.attributes[:lat]).to eq(start_location_params['lat'])
      expect(task_list.start_location.attributes[:lng]).to eq(start_location_params['lng'])
    end

    it 'creates the task_list with the correct end_location attributes' do
      expect(task_list.end_location.attributes[:id]).to eq(end_location_params['id'])
      expect(task_list.end_location.attributes[:type]).to eq(end_location_params['type'])
      expect(task_list.end_location.attributes[:location_name]).to eq(end_location_params['location_name'])
      expect(task_list.end_location.attributes[:lat]).to eq(end_location_params['lat'])
      expect(task_list.end_location.attributes[:lng]).to eq(end_location_params['lng'])
    end
  end

  dummy_class(:task_list_model, Ioki::Model::Operator, Ioki::Model::Base) do
    attribute :start_location,
              on:         [:create, :read, :update],
              type:       :object,
              class_name: %w[Place Station]

    attribute :end_location,
              on:         [:create, :read, :update],
              type:       :object,
              class_name: %w[Place Station]
  end

  describe 'defined attributes' do
    it { is_expected.to define_attribute(:id).as(:string) }
    it { is_expected.to define_attribute(:type).as(:string) }
    it { is_expected.to define_attribute(:created_at).as(:date_time) }
    it { is_expected.to define_attribute(:updated_at).as(:date_time) }

    it { is_expected.to define_attribute(:actual_ends_at).as(:date_time) }
    it { is_expected.to define_attribute(:actual_starts_at).as(:date_time) }
    it { is_expected.to define_attribute(:ad_hoc_bookable).as(:boolean) }
    it { is_expected.to define_attribute(:deactivated).as(:boolean) }
    it { is_expected.to define_attribute(:end_location).as(:object).with(class_name: %w[Place Station]) }
    it { is_expected.to define_attribute(:end_location_id).as(:string) }
    it { is_expected.to define_attribute(:end_location_type).as(:string) }
    it { is_expected.to define_attribute(:end_place).as(:object).with(class_name: 'Place') }
    it { is_expected.to define_attribute(:end_place_id).as(:string) }
    it { is_expected.to define_attribute(:matching_configuration_id).as(:string) }
    it { is_expected.to define_attribute(:paused).as(:boolean) }
    it { is_expected.to define_attribute(:ends_at).as(:date_time) }
    it { is_expected.to define_attribute(:starts_at).as(:date_time) }
    it { is_expected.to define_attribute(:prebookable).as(:boolean) }
    it { is_expected.to define_attribute(:start_location).as(:object).with(class_name: %w[Place Station]) }
    it { is_expected.to define_attribute(:start_location_id).as(:string) }
    it { is_expected.to define_attribute(:start_location_type).as(:string) }
    it { is_expected.to define_attribute(:start_place).as(:object).with(class_name: 'Place') }
    it { is_expected.to define_attribute(:start_place_id).as(:string) }
    it { is_expected.to define_attribute(:state).as(:string) }
    it { is_expected.to define_attribute(:state_options).as(:array) }
    it { is_expected.to define_attribute(:vehicle_id).as(:string) }
  end

  context 'when the start_location_type is place and the end_location_type is station' do
    let(:start_location_type) { 'place' }
    let(:end_location_type) { 'station' }

    include_examples 'creates the task_list with the correct attributes'

    it do
      expect(task_list.start_location).to be_a(Ioki::Model::Operator::Place)
      expect(task_list.end_location).to be_a(Ioki::Model::Operator::Station)
    end
  end

  context 'when the start_location_type is station and end_location_type is place' do
    let(:start_location_type) { 'station' }
    let(:end_location_type) { 'place' }

    include_examples 'creates the task_list with the correct attributes'

    it do
      expect(task_list.start_location).to be_a(Ioki::Model::Operator::Station)
      expect(task_list.end_location).to be_a(Ioki::Model::Operator::Place)
    end
  end

  context 'when the type is neither station or place for end_location and start_location' do
    let(:start_location_type) { 'foobar' }
    let(:end_location_type) { 'foobar' }

    it do
      expect(task_list.start_location).not_to be_a(Ioki::Model::Operator::Station)
      expect(task_list.start_location).to match(start_location_params)
    end
  end
end
