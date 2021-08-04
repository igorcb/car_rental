# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @cars = Car.not_rented
  end
end
