require 'rails_helper'

RSpec.describe Car, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to validate_presence_of(:name) }
  
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  it { is_expected.to validate_presence_of(:rented) }
  it { is_expected.to have_many(:rents) }

  describe ".rented" do
    it "includes cars with rented flag" do
      car_rented = FactoryBot.create(:car)
      car_rented.update(rented: true)
      expect(Car.rented).to include(car_rented)
    end

    it "excludes cars without rented flag" do
      car_not_rented = FactoryBot.create(:car)
      car_not_rented.update(rented: false)
      expect(Car.rented).not_to include(car_not_rented)
    end
  end
end
