# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#    RENTAL
#     { addr_full_adress: "201 Chilean Ave Palm Beach FL 33480"
#     addr_street_name: "Chilean Ave"
#     addr_street_num: "201"
#     addr_zip: "33480"
#     addr_city: "Palm Beach"
#     addr_state: "FL"
#     dets_beds: 2
#     dets_baths: 1
#     dets_is_complex: true
#     dets_stories: 2
#     dets_company_owned: true
#     dets_owner: "John Doe"
#     amen_parking: false
#     amen_pets: true
#     amen_washer_dryer: true 
#     amen_pool: false
#     amen_spa: true
#     amen_gym: false
#     amen_dishwasher: false
#     amen_central_air: true
#     amen_heater: false
#     util_gas: false
#     util_electricity: false
#     util_trash: true
#     util_water: false
#     util_tv: true
#     util_wifi: false }

#      REVIEW
#      { overall: 4,
#      safety: 4,
#      clean: 5,
#      noise: 1,
#      price: 3,
#      comment: "This was an interesting house",
#      rental_id: 1,
#      user_id: 1 }

#      IMAGE
#       { filename: "h01.jpg"
#       rental_id: 1 }

users = User.create(
  [
    { email: 'a@a.com', password: "a", password_confirmation: "a"},
    { email: 'b@b.com', password: "b", password_confirmation: "b"},
    { email: 'c@c.com', password: "c", password_confirmation: "c"}
  ])

rentals = Rental.create(
  [
    { addr_full_adress: "208 Wollaston Ave Arlington MA 02476", addr_street_name: "Wollaston Ave", addr_street_num: "208", addr_zip: "02476", addr_city: "Arlington", addr_state: "MA", dets_beds: 3, dets_baths: 2, dets_is_complex: false, dets_stories: 2, dets_company_owned: false, dets_owner: "", amen_parking: true, amen_pets: false, amen_washer_dryer: true , amen_pool: true, amen_spa: false, amen_gym: false, amen_dishwasher: false, amen_central_air: true, amen_heater: true, util_gas: false, util_electricity: false, util_trash: true, util_water: true, util_tv: false, util_wifi: true },
    { addr_full_adress: "201 Chilean Ave Palm Beach FL 33480", addr_street_name: "Chilean Ave", addr_street_num: "201", addr_zip: "33480", addr_city: "Palm Beach", addr_state: "FL", dets_beds: 2, dets_baths: 1, dets_is_complex: true, dets_stories: 2, dets_company_owned: true, dets_owner: "John Doe", amen_parking: false, amen_pets: true, amen_washer_dryer: true , amen_pool: false, amen_spa: true, amen_gym: false, amen_dishwasher: false, amen_central_air: true, amen_heater: false, util_gas: false, util_electricity: false, util_trash: true, util_water: false, util_tv: true, util_wifi: false }
  ])

reviews = Review.create(
  [
      { overall: 4, safety: 4, clean: 5, noise: 1, price: 3, comment: "This was an interesting house", rental_id: 1, user_id: 3 },
      { overall: 2, safety: 1, clean: 3, noise: 3, price: 2, comment: "Horible expirence living here. Can't wait to move.", rental_id: 1, user_id: 2 },
      { overall: 5, safety: 5, clean: 4, noise: 1, price: 5, comment: "Loved this place, but expensive", rental_id: 2, user_id: 1 },
      { overall: 4, safety: 3, clean: 2, noise: 2, price: 2, comment: "dirty but nice enough", rental_id: 1, user_id: 1 },
      { overall: 1, safety: 1, clean: 1, noise: 1, price: 1, comment: "A dump", rental_id: 2, user_id: 2 },
      { overall: 3, safety: 3, clean: 1, noise: 4, price: 2, comment: "In the process of remodeling", rental_id: 2, user_id: 3 },
      { overall: 5, safety: 5, clean: 5, noise: 2, price: 4, comment: "Newly remodeled. Very nice", rental_id: 2, user_id: 1 },
      { overall: 4, safety: 4, clean: 5, noise: 2, price: 4, comment: "Lovely little place now. Sooo much better than before", rental_id: 2, user_id: 2 }
  ])

images = Image.create(
[
      { filename: "h01.jpg", rental_id: 1 },
      { filename: "h02.jpg", rental_id: 1 },
      { filename: "h03.jpg", rental_id: 1 },
      { filename: "h04.jpg", rental_id: 1 },
      { filename: "h05.jpg", rental_id: 2 },
      { filename: "h06.jpg", rental_id: 2 },
      { filename: "h07.jpg", rental_id: 2 }
])
