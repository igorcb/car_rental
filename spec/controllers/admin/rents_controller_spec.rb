# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::RentsController, type: :controller do
  before do
    @car = create(:car)
  end

  context 'GET #index' do
    let!(:rents) { create_list(:rent, 5) }
    let(:rent_nil) { nil }

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'should rent empty' do
      get :index
      expect(assigns(:rent_nil)).to be_nil
    end

    it 'should have list rents' do
      create(:rent)
      get :index
      expect(assigns(:rent)).not_to eq be_nil
    end
  end

  context 'GET #show' do
    let(:rent) { create(:rent) }

    it 'should success and render to show page' do
      get :show, params: { id: rent.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it 'where have id' do
      get :show, params: { id: rent.id }
      expect(assigns(:rent)).to eq(rent)
    end
  end

  context 'GET #new' do
    it 'should success and render to new page' do
      get :new
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
      expect(response).to redirect_to(admin_rent_path(assigns(:rent)))
    end

    it 'not create a new rent' do
      params = { car_id: @car.id }
      post :create, params: { rent: params }
      expect(response).to render_template('new')
    end
  end

  context 'GET #edit' do
    let(:rent) { create(:rent) }
    it 'should success and render to edit page' do
      get :edit, params: { id: rent.id }
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  context 'PUT #update' do
    let!(:rent) { create(:rent) }

    it 'should update rent info' do
      params = {
        name: Faker::Name.name,
        date_start: Date.current + 4,
        date_end: Date.current + 8
      }

      put :update, params: { id: rent.id, rent: params }
      rent.reload
      expect(rent.name).to eq(params[:name])
      expect(rent.date_start).to eq(params[:date_start])
      expect(rent.date_end).to eq(params[:date_end])

      expect(flash[:notice]).to eq('Rent update successfull.')
      expect(response).to redirect_to(admin_rent_path(assigns(:rent)))
    end

    it 'should not update post info' do
      params = { name: nil, date_start: nil, date_end: nil }

      put :update, params: { id: rent.id, rent: params }
      expect(response).to render_template(:edit)
    end
  end
end
