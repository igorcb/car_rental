require 'rails_helper'

RSpec.describe Admin::CarsController, type: :controller do
  before do
    @category = create(:category)
  end

  context 'GET #index' do
    let!(:car) { create_list(:car, 5) }
    let(:car_nil) { nil }

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'should car empty' do
      get :index
      expect(assigns(:car_nil)).to be_nil
    end

    it 'should have list cars' do
      create(:car)
      get :index
      expect(assigns(:car)).not_to eq be_nil
    end
  end

  context 'GET #show' do
    let(:car) { create(:car) }

    it 'should success and render to show page' do
      get :show, params: { id: car.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it 'where have id' do
      get :show, params: { id: car.id }
      expect(assigns(:car)).to eq(car)
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
      { 
        category_id: @category.id,
        name: Faker::Name.name,
        price: Faker::Commerce.price(range: 1.0..400.0) ,
        rented: false,
        url_image: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
        }
    end

    it 'create a new car' do
      post :create, params: { car: params }
      expect(flash[:notice]).to eq('Car was successfully created.')
      expect(response).to redirect_to(admin_car_path(assigns(:car)))
    end

    it 'not create a new car' do
      params = { category_id: @category.id }
      post :create, params: { car: params }
      expect(response).to render_template('new')
    end
  end  

  context 'GET #edit' do
    let(:car) { create(:car) }
    it 'should success and render to edit page' do
      get :edit, params: { id: car.id }
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  context 'PUT #update' do
    let!(:car) { create(:car) }

    it 'should update car info' do
      params = { 
                 name: Faker::Name.name,
                 rented: false
                 }

      put :update, params: { id: car.id, car: params }
      car.reload
      expect(car.name).to eq(params[:name])
      expect(car.rented).to eq(params[:rented])

      expect(flash[:notice]).to eq('Car update successfull.')
      expect(response).to redirect_to(admin_car_path(assigns(:car)))
    end

    it 'should not update post info' do
      params = { name: nil, price: nil, url_image: nil }

      put :update, params: { id: car.id, car: params }
      expect(response).to render_template(:edit)
    end
  end




end
