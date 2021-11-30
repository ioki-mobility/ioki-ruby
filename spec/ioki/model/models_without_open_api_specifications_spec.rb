# frozen_string_literal: true

RSpec.describe 'models without open api specifications', :vcr do
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
end
