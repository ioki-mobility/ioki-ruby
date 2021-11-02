# frozen_string_literal: true

require 'ioki/model/platform/vehicle'

module Ioki
  module Model
    module Platform
      class Driver < Base
        attribute :connected_vehicle, type: :object,    on: :read, model_class: Ioki::Model::Platform::Vehicle
        attribute :external_id,       type: :string,    on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :locked_at,         type: :date_time, on: :read

        attribute :username,          type: :string,    on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :first_name,        type: :string,    on: [:create, :update], omit_if_blank_on: [:create, :update]
        attribute :last_name,         type: :string,    on: [:create, :update], omit_if_blank_on: [:create, :update]

        attribute :display_name,      type: :string,    on: :read
        attribute :locale,            type: :string,    on: :create, omit_if_blank_on: :create
        attribute :phone_number,      type: :string,    on: :create, omit_if_blank_on: :create
      end
    end
  end
end
