require 'rails_helper'

RSpec.describe Rent, type: :model do
  let(:car) { build(:car) }
  
  before do
    @rent = Rent.create(car: car, name: Faker::Name.name, date_start: Date.current, date_end: Date.current + 2.days)
  end

  subject { @rent }

  it { is_expected.to belong_to(:car) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:date_start) }
  it { is_expected.to validate_presence_of(:date_end) }
  it { is_expected.to validate_presence_of(:price) }
end
