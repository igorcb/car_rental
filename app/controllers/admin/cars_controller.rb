# frozen_string_literal: true

module Admin
  class CarsController < ApplicationController
    before_action :set_car, only: %i[show update edit]

    def index
      @cars = Car.all
    end

    def show; end

    def new
      @car = Car.new
    end

    def edit; end

    def create
      @car = Car.new(car_params)
      respond_to do |format|
        if @car.save
          format.html { redirect_to admin_car_url(@car), notice: 'Car was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      if @car.update(car_params)
        flash[:notice] = 'Car update successfull.'
        redirect_to admin_car_url(@car)
      else
        render :edit
      end
    end

    private

    def car_params
      params.require(:car).permit(:category_id, :name, :price, :rented, :url_image)
    end

    def set_car
      @car = Car.find(params[:id])
    end
  end
end
