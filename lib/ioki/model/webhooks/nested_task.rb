# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class NestedTask < Base
        attribute :type, type: :string
        attribute :id, type: :string
        attribute :created_at, type: :date_time
        attribute :updated_at, type: :date_time
        attribute :version, type: :integer
        attribute :acceptable, type: :boolean
        attribute :accepted_at, type: :date_time
        attribute :cancellable, type: :boolean
        attribute :cancelled_at, type: :date_time
        attribute :completable, type: :boolean
        attribute :completed_at, type: :date_time
        attribute :completer_id, type: :string
        attribute :completer_type, type: :string
        attribute :pause_id, type: :string
        attribute :rejectable, type: :boolean
        attribute :ride_id, type: :string
        attribute :state, type: :string
        attribute :task_list_id, type: :string
        attribute :waypoint_type, type: :string
        attribute :calculated_point, type: :object, class_name: 'CalculatedPoint'
      end
    end
  end
end
