# frozen_string_literal: true

RSpec.describe 'models without open api specifications', vcr: { record: :all } do
  describe 'platform_api models' do
    setup_platform_client(:platform_client)
    let(:product) { platform_client.products.first }

    describe 'models accessible on the product endpoint' do
      describe Ioki::Model::Platform::Area do
        it 'has data for all defined attributes' do
          expect(product.area).to be_a(Ioki::Model::Platform::Area)
          expect(product.area.coordinates).to be_a(Array)
          expect(product.area.coordinates.flatten(3)).to all(be_a(Float))
        end
      end

      describe Ioki::Model::Platform::BoundingBox do
        it 'has data for all defined attributes' do
          expect(product.bounding_box).to be_a(Ioki::Model::Platform::BoundingBox)
          expect(product.bounding_box.max).to be_a(Ioki::Model::Platform::Coordinate)
          expect(product.bounding_box.max.lat).to be_a(Float)
          expect(product.bounding_box.max.lng).to be_a(Float)
          expect(product.bounding_box.min).to be_a(Ioki::Model::Platform::Coordinate)
          expect(product.bounding_box.min.lat).to be_a(Float)
          expect(product.bounding_box.min.lng).to be_a(Float)
        end
      end

      describe Ioki::Model::Platform::RideOptions do
        it 'has data for all defined attributes' do
          expect(product.ride_options).to be_a(Ioki::Model::Platform::RideOptions)
          expect(product.ride_options.book_for_others).to be(true).or(be(false))
          expect(product.ride_options.destination_time_based_matching).to be(true).or(be(false))
          expect(product.ride_options.max_wheelchairs).to be_a(Integer)
          expect(product.ride_options.max_walkers).to be_a(Integer)
          expect(product.ride_options.passengers).to be_a(Ioki::Model::Platform::PassengerOptions)
          expect(product.ride_options.passengers.types.first).to be_a(Ioki::Model::Platform::PassengerType)
          expect(product.ride_options.prebooking_threshold).to be_a(Ioki::Model::Platform::PrebookingThreshold)
        end
      end

      describe Ioki::Model::Platform::Timezone do
        it 'has data for all defined attributes' do
          expect(product.timezone).to be_a(Ioki::Model::Platform::Timezone)
          expect(product.timezone.utc_offset).to be_a(Integer)
          expect(product.timezone.identifier).to be_a(String)
        end
      end
    end

    describe 'models accessible on the provider endpoint' do
      let(:provider) { platform_client.providers.first }

      it 'has data for all defined attributes' do
        expect(provider.service_credit_options).to be_a(Ioki::Model::Platform::ServiceCreditOptions)
        # expect(provider.service_credit_options.packages.first).to be_a(Ioki::Model::Platform::Package)
        # Missing data on demo product
      end
    end

    describe 'models accessible on the rides endpoint' do
      it 'has data for all defined attributes' do
        expect(platform_client.rides(product).first.route).to be_a(Ioki::Model::Platform::Route)
        expect(platform_client.rides(product).first.route.track).to be_a(String)
      end
    end

    describe 'models accessible on the ride_inqury creation endpoint' do
      let(:ride_inqury) do
        Ioki::Model::Platform::RideInquiry.new(origin: { lat: 1, lng: 1 }, destination: { lat: 1, lng: 1 })
      end

      it 'has data for all defined attributes' do
        returned_ride_inquiry = platform_client.create_ride_inquiry(product, ride_inqury)
        expect(returned_ride_inquiry.availability).to be_a(Ioki::Model::Platform::Availability)
        expect(returned_ride_inquiry.constraints).to be_a(Ioki::Model::Platform::Constraints)

        # expect(returned_ride_inquiry.estimations.links.first.android).to be_a(Ioki::Model::Platform::RideInquiryLinkAndroid)
        # expect(returned_ride_inquiry.estimations.links.first.ios).to be_a(Ioki::Model::Platform::RideInquiryLinkIos)
        # Missing data on demo product
      end
    end
  end

  describe 'passenger_api models' do
    setup_platform_client(:platform_client)
    setup_passenger_client(:passenger_client)

    before do
      passenger_client.config.api_token = platform_client.create_request_token(
        platform_client.providers.first,
        platform_client.users(platform_client.providers.first).last,
        Ioki::Model::Platform::PassengerRequestToken.new(
          client_identifier: 'dev.passengerapi.test.backend'
        )
      ).token
    end

    describe 'Product endpoint' do
      let(:product) { passenger_client.products.first }

      describe 'models accessible on the product endpoint' do
        describe Ioki::Model::Passenger::Area do
          it 'has data for all defined attributes' do
            expect(product.area).to be_a(Ioki::Model::Passenger::Area)
            expect(product.area.coordinates).to be_a(Array)
            expect(product.area.coordinates.flatten(3)).to all(be_a(Float))
          end
        end

        describe Ioki::Model::Passenger::BoundingBox do
          it 'has data for all defined attributes' do
            expect(product.bounding_box).to be_a(Ioki::Model::Passenger::BoundingBox)
            expect(product.bounding_box.max).to be_a(Ioki::Model::Passenger::Coordinate)
            expect(product.bounding_box.max.lat).to be_a(Float)
            expect(product.bounding_box.max.lng).to be_a(Float)
            expect(product.bounding_box.min).to be_a(Ioki::Model::Passenger::Coordinate)
            expect(product.bounding_box.min.lat).to be_a(Float)
            expect(product.bounding_box.min.lng).to be_a(Float)
          end
        end

        describe Ioki::Model::Passenger::RideOptions do
          it 'has data for all defined attributes' do
            expect(product.ride_options).to be_a(Ioki::Model::Passenger::RideOptions)
            expect(product.ride_options.book_for_others).to be(true).or(be(false))
            expect(product.ride_options.destination_time_based_matching).to be(true).or(be(false))
            expect(product.ride_options.max_wheelchairs).to be_a(Integer)
            expect(product.ride_options.max_walkers).to be_a(Integer)
            expect(product.ride_options.passengers).to be_a(Ioki::Model::Passenger::PassengerOptions)
            expect(product.ride_options.passengers.types.first).to be_a(Ioki::Model::Passenger::PassengerType)
            expect(product.ride_options.prebooking_threshold).to be_a(Ioki::Model::Passenger::PrebookingThreshold)
          end
        end

        describe Ioki::Model::Passenger::Timezone do
          it 'has data for all defined attributes' do
            expect(product.timezone).to be_a(Ioki::Model::Passenger::Timezone)
            expect(product.timezone.utc_offset).to be_a(Integer)
            expect(product.timezone.identifier).to be_a(String)
          end
        end

        describe Ioki::Model::Passenger::ImageVersion do
          it 'has data for all defined attributes' do
            pending('Needs a product with an avatar')

            expect(product.avatar).to be_a(Ioki::Model::Passenger::ImageUpload)
            expect(product.avatar.versions.first).to be_a(Ioki::Model::Passenger::ImageVersion)
            expect(product.avatar.versions.first.large).to be_a(String)
            expect(product.avatar.versions.first.medium).to be_a(String)
            expect(product.avatar.versions.first.small).to be_a(String)
            expect(product.avatar.versions.first.mini).to be_a(String)
          end
        end
      end

      describe 'models accessible on the rides endpoint' do
        it 'has data for all defined attributes' do
          expect(passenger_client.rides(product).first.route).to be_a(Ioki::Model::Passenger::Route)
          expect(passenger_client.rides(product).first.route.track).to be_a(String)
          pending('Needs a ride with a ticket that has a ticket with mobile_ticket_data')
          expect(passenger_client.rides(product).first.ticket.mobile_ticket_data).to be_a(Ioki::Model::Passenger::MobileTicketData)
          expect(passenger_client.rides(product).first.ticket.mobile_ticket_data.purchase_id).to be_a(String)
          expect(passenger_client.rides(product).first.ticket.mobile_ticket_data.customer_code).to be_a(String)
        end

        it 'cancellation' do
          pending('cancellation.rb -> cancel outgoing model only')
        end
      end

      describe 'models accessible on the ride_inqury creation endpoint' do
        let(:ride_inqury) do
          Ioki::Model::Passenger::RideInquiry.new(
            origin:      { lat: 1, lng: 1 },
            destination: { lat: 1, lng: 1 },
            product_id:  product.id
          )
        end

        it 'has data for all defined attributes' do
          returned_ride_inquiry = passenger_client.create_ride_inquiry(ride_inqury)
          expect(returned_ride_inquiry.availability).to be_a(Ioki::Model::Passenger::Availability)
          expect(returned_ride_inquiry.constraints).to be_a(Ioki::Model::Passenger::Constraints)
        end
      end

      describe 'models accessible on the client endpoint' do
        it 'has data for all defined attributes' do
          features = passenger_client.bootstrap.client.features

          expect(features).to be_a(Ioki::Model::Passenger::Features)
          expect(features.analytics_tracking).to be(true).or(be(false))
          expect(features.failed_payment_handling).to be(true).or(be(false))
          expect(features.marketing_automation).to be(true).or(be(false))
          pending('Needs a client with a minimum_age_confirmation feature enabled')
          expect(features.minimum_age_confirmation).to be_a(Ioki::Model::Passenger::MinimumAgeConfirmation)
          expect(features.minimum_age_confirmation.minimum_age).to be_a(Integer)
          expect(features.newsletter).to be(true).or(be(false))
          expect(features.non_purchasable_personal_discounts).to be(true).or(be(false))
          expect(features.payment).to be(true).or(be(false))
          expect(features.promo_codes).to be(true).or(be(false))
          expect(features.purchasable_personal_discounts).to be(true).or(be(false))
          expect(features.referrals).to be(true).or(be(false))
          expect(features.service_credits).to be(true).or(be(false))
          expect(features.unique_customer_id).to be(true).or(be(false))
          expect(features.user_email_required).to be(true).or(be(false))
        end
      end
    end
  end
end
