class Rent < ApplicationRecord
  before_validation :calculate_price_total, on: :create

  belongs_to :car, required: true
  validates :name, presence: true 
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  
  def calculate_price_total
    price_total = 0.00
    price_total = CalculatePriceService.new(self.car.price, self.date_start, self.date_end).call 
    self.price = price_total
  end

end
