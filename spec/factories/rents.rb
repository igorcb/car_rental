# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    car
    sequence(:name) { |n| "Rent Name #{n}" }
    date_start { Date.current }
    date_end { Date.current + 2.days }
    price { '9.99' }
  end
end
