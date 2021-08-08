# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    user
  end
end
