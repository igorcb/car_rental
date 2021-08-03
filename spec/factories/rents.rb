FactoryBot.define do
  factory :rent do
    car
    sequence(:name) { |n| "Car #{n}" }
    date_start { Date.current }
    date_end { Date.current + 2.days }
    price { "9.99" }
  end
end
