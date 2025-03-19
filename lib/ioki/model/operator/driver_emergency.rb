# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class DriverEmergency < Base
        attribute :type,
                  on:   :read,
                  type: :string

        attribute :id,
                  on:   :read,
                  type: :string

        attribute :created_at,
                  on:   :read,
                  type: :date_time

        attribute :updated_at,
                  on:   :read,
                  type: :date_time

        attribute :acknowledged_at,
                  on:   :read,
                  type: :date_time

        attribute :acknowledger_type,
                  on:   :read,
                  type: :string

        attribute :acknowledger_name,
                  on:   :read,
                  type: :string

        attribute :driver,
                  on:         :read,
                  type:       :object,
                  class_name: 'Driver'

        attribute :vehicle,
                  on:         :read,
                  type:       :object,
                  class_name: 'Vehicle'

        attribute :task_list,
                  on:         :read,
                  type:       :object,
                  class_name: 'TaskList'
      end
    end
  end
end
