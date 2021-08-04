# frozen_string_literal: true

class RentsController < ApplicationController
  def new
    @rent = Rent.new
    @car = Car.find(params[:car_id])
  end

  def create
    @rent = Rent.new(rent_params)

    respond_to do |format|
      if @rent.save
        format.html { redirect_to @rent, notice: 'Rental was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @rent = Rent.find(params[:id])
  end

  private

  def rent_params
    params.require(:rent).permit(:car_id, :name, :date_start, :date_end)
  end
end
