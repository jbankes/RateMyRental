require 'faker'

FactoryGirl.define do
  factory :rental do
    addr_full_adress {Faker::Address.street_address}
    addr_street_name {Faker::Address.street_address}
    addr_street_num {Faker::Address.secondary_address}
    addr_zip {Faker::Address.zip_code}
    addr_city {Faker::Address.city}
  dets_beds {Faker::Number.between(1, 10)}
  dets_baths {Faker::Number.between(1, 10)}
  dets_is_complex {Faker::Boolean.boolean}
  dets_stories {Faker::Number.between(1, 4)}
  dets_company_owned {Faker::Boolean.boolean}
  dets_owner {Faker::Name.first_name}
  amen_parking {Faker::Boolean.boolean}
  amen_pets {Faker::Boolean.boolean}
  amen_washer_dryer {Faker::Boolean.boolean}
  amen_pool {Faker::Boolean.boolean}
  amen_spa {Faker::Boolean.boolean}
  amen_gym {Faker::Boolean.boolean}
  amen_dishwasher {Faker::Boolean.boolean}
  amen_central_air {Faker::Boolean.boolean}
  amen_heater {Faker::Boolean.boolean}
  util_gas {Faker::Boolean.boolean}
  util_electricity {Faker::Boolean.boolean}
  util_trash {Faker::Boolean.boolean}
  util_water {Faker::Boolean.boolean}
  util_tv {Faker::Boolean.boolean}
  util_wifi {Faker::Boolean.boolean}
    
  end
end
