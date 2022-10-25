# frozen_string_literal: true

RSpec.describe Ioki::Endpoints::Delete do
  let(:model_class) { Ioki::Model::Platform::Product }
  let(:client)      { instance_double(Ioki::Client, 'client', build_request_url: 'url') }
  let(:endpoint)    { described_class.new('product', base_path: ['base_path'], model_class: model_class) }
  let(:params)      { instance_double(Hash, 'params') }

  it 'calls #request on the client instantiating a class from the result' do
    expect(client).to receive(:request).with(
      url:    'url',
      method: :delete,
      params: params
    ).and_return(
      { 'data' => { 'id' => '0815' } }
    )

    result = endpoint.call(client, ['0815'], params: params)

    expect(result).to be_a(Ioki::Model::Platform::Product)
    expect(result.id).to eq('0815')
  end
end
