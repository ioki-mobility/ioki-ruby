# frozen_string_literal: true

RSpec.describe 'paginated call to an indexed resource', :vcr do
  # Compare fixtures/vcr_cassettes for the recorded requests and responses for this example.

  setup_platform_client(:platform_client)

  let!(:product) { platform_client.products.first }
  let!(:rides) { platform_client.rides(product) }

  it 'defaults to the server default' do
    expect(rides.length).to eq 25
  end

  it 'does not allow to exceed server limit' do
    expect(platform_client.rides(product, params: { per_page: 5000 }).length).to eq 100
  end

  it 'returns the same result for page 0 and page 1' do
    expect(platform_client.rides(product, params: { per_page: 5, page: 0 }))
      .to eq platform_client.rides(product, params: { per_page: 5, page: 1 })
  end

  it 'returns the results in the same order if collecting different pages' do
    paginated_rides = (1..5).inject({}) do |memo, page|
      memo.merge(page => platform_client.rides(product, params: { per_page: 5, page: page }))
    end

    expect(rides.map(&:id)).to eq(paginated_rides.flat_map { |_page, page_rides| page_rides.map(&:id) })
  end
end
