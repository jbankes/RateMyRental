class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :addr_full_adress
      t.string :addr_street_name
      t.integer :addr_street_num
      t.integer :addr_zip
      t.string :addr_city
      t.string :addr_state
      t.integer :dets_beds
      t.integer :dets_baths
      t.boolean :dets_is_complex
      t.integer :dets_stories
      t.boolean :dets_company_owned
      t.string :dets_owner
      t.boolean :amen_parking
      t.boolean :amen_pets
      t.boolean :amen_washer_dryer
      t.boolean :amen_pool
      t.boolean :amen_spa
      t.boolean :amen_gym
      t.boolean :amen_dishwasher
      t.boolean :amen_central_air
      t.boolean :amen_heater
      t.boolean :util_gas
      t.boolean :util_electricity
      t.boolean :util_trash
      t.boolean :util_water
      t.boolean :util_tv
      t.boolean :util_wifi

      t.timestamps null: false
    end
  end
end
