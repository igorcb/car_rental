FactoryBot.define do
  factory :car do
    category
    sequence(:name) { |n| "Car #{n}" }
    price { "9.99" }
    rented { false }
    url_image { "MyString" }
  end
end
