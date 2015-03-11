RSpec.describe ErrorsController do
  it 'should return a json 404 response' do
    get "/#{SecureRandom.hex}"
    expect(response.status).to eq 404
    expect(response.headers['Content-Type']).to start_with 'application/json'
    expect(JSON.parse response.body).to eq('error' => 'NotFound')
  end
end
