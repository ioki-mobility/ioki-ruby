# frozen_string_literal: true

module Ioki
  module Model
    module Webhooks
      class Task < Base
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
        attribute :completed_at, type: :string
        attribute :rejectable, type: :boolean
        attribute :state, type: :string
        attribute :task_list_id, type: :string
        attribute :waypoint_type, type: :string
        attribute :calculated_point, type: :object, class_name: 'CalculatedPoint'
        attribute :completer, type: :object, class_name: 'Admin'
        attribute :pause, type: :object, class_name: 'Pause'
        attribute :ride, type: :object, class_name: 'Ride'
      end
    end
  end
end
