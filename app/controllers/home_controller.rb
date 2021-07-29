class HomeController < ApplicationController
  def index
    @cars = Car.not_rented
  end
end
