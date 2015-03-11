RSpec.describe ApplicationController do
  controller do
    def fail
      raise 'FAIL'
    end
  end

  before do
    routes.draw do
      get '/anonymous/fail'
    end
  end

  it 'should return a json 500 response' do
    get :fail
    expect(response.status).to eq 500
    expect(response.headers['Content-Type']).to start_with 'application/json'
    expect(JSON.parse response.body).to eq('error' => 'RuntimeError')
  end
end
