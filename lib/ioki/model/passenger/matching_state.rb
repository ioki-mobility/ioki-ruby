# frozen_string_literal: true

module Ioki
  module Model
    module Passenger
      class MatchingState < Base
        attribute :type, on: :read, type: :string
        attribute :id, on: :read, type: :string
        attribute :created_at, on: :read, type: :date_time
        attribute :updated_at, on: :read, type: :date_time

        attribute :logs, on: :read, type: :array, class_name: 'MatchingStateLog'
        attribute :final_summary, on: :read, type: :string
        attribute :current_round, on: :read, type: :integer
        attribute :num_ptas_in_round, on: :read, type: :integer
        attribute :num_combinations_in_round, on: :read, type: :integer
        attribute :search_space_time_min_in_round, on: :read, type: :date_time
        attribute :search_space_time_max_in_round, on: :read, type: :date_time
        attribute :num_ptas_overall, on: :read, type: :integer
        attribute :num_combinations_overall, on: :read, type: :integer
        attribute :search_space_time_min_overall, on: :read, type: :date_time
        attribute :search_space_time_max_overall, on: :read, type: :date_time
      end
    end
  end
end
