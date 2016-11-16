require 'faker'

FactoryGirl.define do
  factory :review do
    overall {Faker::Number.between(1, 5)}
    safety {Faker::Number.between(1, 5)}
    clean {Faker::Number.between(1, 5)}
    noise {Faker::Number.between(1, 5)}
    comment {Faker::Lorem.sentence}
    rental {FactoryGirl.create(:rental)}
    user_id {1}
  end
end
