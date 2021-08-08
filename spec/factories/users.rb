# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { Faker::Name.unique.name }
  end
end
