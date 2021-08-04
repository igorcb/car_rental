# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentsController, type: :controller do
  before do
    @car = create(:car)
  end

  context 'GET #new' do
    it 'should success and render to new page' do
      get :new, params: { car_id: @car.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  context 'POST #create' do
    let!(:params) do
      { car_id: @car.id,
        name: Faker::Name.name,
        date_start: Date.current,
        date_end: Date.current + 1.days }
    end

    it 'create a new rent' do
      post :create, params: { rent: params }
      expect(flash[:notice]).to eq('Rental was successfully created.')
      expect(response).to redirect_to(action: :show, id: assigns(:rent).id)
    end

    it 'not create a new rent' do
      params = { car_id: @car.id }
      post :create, params: { rent: params }
      expect(response).to render_template('new')
    end
  end
end
