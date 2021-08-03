require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context 'GET #index' do
    let!(:cars) { FactoryBot.create_list(:car, 6) }
    let(:cars_nil) { nil }

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'should cars empty' do
      get :index
      expect(assigns(:cars_nil)).to be_nil
    end

    it 'should have list cars' do
      FactoryBot.create(:car)
      get :index
      expect(assigns(:cars)).not_to eq be_nil
    end

  end
end