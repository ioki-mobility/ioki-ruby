# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class PassengerNotificationTranslations < Base
        attribute :passenger_notification_en,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_de,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_fr,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_de_ch,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_nl,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_es,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_it,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_ca,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_en_jm,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_ar,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_da,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_tr,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_uk,
                  on:   [:create, :update],
                  type: :string

        attribute :passenger_notification_en_bz,
                  on:   [:create, :update],
                  type: :string
      end
    end
  end
end
