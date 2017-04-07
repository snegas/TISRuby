require 'faker'

FactoryGirl.define do
  factory :products do |f|
    f.name { Faker::Commerce.product_name }
    f.description { Faker::Lorem.paragraph }
    f.price { Faker::Commerce.price }
  end
end