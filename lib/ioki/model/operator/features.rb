# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class Features < Base
        unvalidated true # Specification not available

        attribute :multiple_booking_solutions,
                  type: :boolean,
                  on:   :read

        attribute :supports_lines,
                  type: :boolean,
                  on:   :read

        attribute :supports_tipping,
                  type: :boolean,
                  on:   :read

        attribute :supports_updating_passengers_on_ride,
                  type: :boolean,
                  on:   :read

        attribute :supports_passenger_update_by_user,
                  type: :boolean,
                  on:   :read

        attribute :supports_passenger_cancellation_statement,
                  type: :boolean,
                  on:   :read

        attribute :supports_ticketing,
                  type: :boolean,
                  on:   :read

        attribute :supports_repositioning_tasks,
                  type: :boolean,
                  on:   :read

        attribute :supports_admin_management,
                  type: :boolean,
                  on:   :read

        attribute :supports_custom_rbac,
                  type: :boolean,
                  on:   :read

        attribute :supports_driver_emergency_button,
                  type: :boolean,
                  on:   :read

        attribute :supports_broadcasts,
                  type: :boolean,
                  on:   :read

        attribute :supports_driver_push_notifications,
                  type: :boolean,
                  on:   :read

        attribute :supports_vehicle_telemetry,
                  type: :boolean,
                  on:   :read

        attribute :supports_blacklisted_travel_combinations,
                  type: :boolean,
                  on:   :read

        attribute :supports_gtfs_flex_feed,
                  type: :boolean,
                  on:   :read

        attribute :supports_prohibit_parallel_rides,
                  type: :boolean,
                  on:   :read

        attribute :supports_public_transport_alternatives,
                  type: :boolean,
                  on:   :read

        attribute :supports_external_planning_tools,
                  type: :boolean,
                  on:   :read

        attribute :supports_odometer,
                  type: :boolean,
                  on:   :read

        attribute :supports_restricted_areas,
                  type: :boolean,
                  on:   :read

        attribute :supports_operator_booking,
                  type: :boolean,
                  on:   :read

        attribute :supports_personal_discounts,
                  type: :boolean,
                  on:   :read

        attribute :supports_station_public_transport_changeover,
                  type: :boolean,
                  on:   :read

        attribute :supports_announcements,
                  type: :boolean,
                  on:   :read

        attribute :supports_serial_booking,
                  type: :boolean,
                  on:   :read

        attribute :supports_fare_estimation_for_ride_inquiries,
                  type: :boolean,
                  on:   :read

        attribute :supports_pause_reminders,
                  type: :boolean,
                  on:   :read

        attribute :supports_station_search_via_passenger_api,
                  type: :boolean,
                  on:   :read

        attribute :supports_warnings_for_delayed_rides,
                  type: :boolean,
                  on:   :read

        attribute :supports_no_show_blocking,
                  type: :boolean,
                  on:   :read

        attribute :supports_prebooking_ui_assistance,
                  type: :boolean,
                  on:   :read

        attribute :supports_venues,
                  type: :boolean,
                  on:   :read

        attribute :supports_intermodal_matching,
                  type: :boolean,
                  on:   :read

        attribute :supports_driver_otc_login,
                  type: :boolean,
                  on:   :read

        attribute :supports_driver_otc_via_sms,
                  type: :boolean,
                  on:   :read

        attribute :auto_accept_by_driver_client,
                  type: :boolean,
                  on:   :read

        attribute :driver_client_can_reject_task,
                  type: :boolean,
                  on:   :read

        attribute :drivers_can_pause,
                  type: :boolean,
                  on:   :read

        attribute :driver_client_reconfirms_early_pickup_and_dropoff_completion?,
                  type: :boolean,
                  on:   :read

        attribute :admins_can_set_arbitrary_driver_password,
                  type: :boolean,
                  on:   :read

        attribute :show_autonomous_onboarding_in_passenger_clients,
                  type: :boolean,
                  on:   :read

        attribute :passenger_note_to_driver,
                  type: :boolean,
                  on:   :read

        attribute :passenger_client_displays_stations_on_map,
                  type: :boolean,
                  on:   :read

        attribute :driver_shift_summaries,
                  type: :boolean,
                  on:   :read

        attribute :driver_automation,
                  type: :boolean,
                  on:   :read
      end
    end
  end
end
