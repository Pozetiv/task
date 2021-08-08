# frozen_string_literal: true

FactoryBot.define do
  factory :mark do
    post
    grade { rand(1..5) }
    author_id { Faker::Internet.uuid }
  end
end
