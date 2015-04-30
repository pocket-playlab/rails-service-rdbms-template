require 'rails_helper'

RSpec.describe StatusController, type: :controller do
  describe '#check' do
    it 'should render 200 when everything is ok' do
      get :check
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq('errors' => {})
    end

    it 'should render 503 when primary database is not connected' do
      allow(ActiveRecord::Base).to receive(:connected?).and_return(false)
      get :check
      expect(response.status).to eq(503)
      errors = JSON.parse(response.body)['errors']
      expect(errors['database']).to eq('Not connected')
    end

    it 'should render 503 when redis is not connected' do
      allow(REDIS).to receive(:connected?).and_return(false)
      get :check
      expect(response.status).to eq(503)
      errors = JSON.parse(response.body)['errors']
      expect(errors['redis']).to eq('Not connected')
    end

    it 'should render 503 when the redis connection fails' do
      allow(REDIS).to receive(:connected?).and_return(false)
      allow(REDIS).to receive(:info).and_raise(SocketError)
      get :check
      expect(response.status).to eq(503)
      errors = JSON.parse(response.body)['errors']
      expect(errors['redis']).to eq('Not connected')
    end
  end
end
