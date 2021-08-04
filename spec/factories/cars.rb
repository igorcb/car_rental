# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    category
    sequence(:name) { |n| "Car #{n}" }
    price { Faker::Commerce.price(range: 1.0..400.0) }
    rented { false }
    url_image { Faker::Avatar.image(slug: 'my-own-slug', size: '50x50', format: 'jpg') }
  end
end
