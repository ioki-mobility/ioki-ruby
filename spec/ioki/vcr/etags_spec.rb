# frozen_string_literal: true

RSpec.describe 'etags', :vcr do
  setup_platform_client(:platform_client)

  let!(:real_demo_product_id) { 'prd_f041ff2b-1357-49c6-bcd1-d4dd261fc556' }
  let!(:real_demo_driver_id) { 'drv_f8e8bece-2245-43bb-bdc6-aed97672b412' }

  it 'etags are used if a model is given to a show action' do
    existing_driver = platform_client.driver(real_demo_product_id, real_demo_driver_id)

    expect(existing_driver._etag).to start_with 'W/"'
    expect(existing_driver._etag.length).to eq 36

    refetched_driver = platform_client.driver(real_demo_product_id, real_demo_driver_id, model: existing_driver)

    # equality for models is defined by equal attributes
    expect(existing_driver).to eq refetched_driver
  end
end
