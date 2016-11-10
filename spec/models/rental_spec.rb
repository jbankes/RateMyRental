# RSpec file for testing rental model

require 'rails_helper'

RSpec.describe Rental, :type => :model do
  it 'has none to begin with' do
    expect(Rental.count).to eq 0
  end
  #
  # it  'is valid with valid attributes' do
  #   expect(Rental.new(
  #     addr_full_adress: "327 Normal Ave Chico CA 95928"
  #   )).to be_valid
  # end
  #
  # context 'washer_dryer filter' do
  #   it 'returns if 0 is true'
  #
  # end

 
  it "has a valid factory" do
    factory = FactoryGirl.create(:rental)
    expect(factory).to be_valid
  end
  Rental.delete_all
  let(:rentals) {Rental.all} 
 

  let(:electricity) { rentals.where(util_electricity: true) }
  let(:trash) { rentals.where(util_trash: true) }
  let(:water) { rentals.where(util_water: true) }

  it 'should return only rentals with whasher_dryer' do
    one = Rental.create!(amen_washer_dryer: true)
    two = Rental.create!(amen_washer_dryer: false)
    three = Rental.create!(amen_washer_dryer: true)
    true_filter = rentals.washer_dryer(1)
    false_filter = rentals.washer_dryer(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end
	
  it 'should return only rentals with parking' do
    Rental.delete_all
    one = Rental.create!(amen_parking: true)
    two = Rental.create!(amen_parking: false)
    three = Rental.create!(amen_parking: true)
    true_filter = rentals.parking(1)
    false_filter = rentals.parking(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with pets' do
    Rental.delete_all
    one = Rental.create!(amen_pets: true)
    two = Rental.create!(amen_pets: false)
    three = Rental.create!(amen_pets: true)
    true_filter = rentals.pets(1)
    false_filter = rentals.pets(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with pool' do
    Rental.delete_all
    one = Rental.create!(amen_pool: true)
    two = Rental.create!(amen_pool: false)
    three = Rental.create!(amen_pool: true)
    true_filter = rentals.pool(1)
    false_filter = rentals.pool(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with spa' do
    Rental.delete_all
    one = Rental.create!(amen_spa: true)
    two = Rental.create!(amen_spa: false)
    three = Rental.create!(amen_spa: true)
    true_filter = rentals.spa(1)
    false_filter = rentals.spa(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with gym' do
    Rental.delete_all
    one = Rental.create!(amen_gym: true)
    two = Rental.create!(amen_gym: false)
    three = Rental.create!(amen_gym: true)
    true_filter = rentals.gym(1)
    false_filter = rentals.gym(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with dishwasher' do
    Rental.delete_all
    one = Rental.create!(amen_dishwasher: true)
    two = Rental.create!(amen_dishwasher: false)
    three = Rental.create!(amen_dishwasher: true)
    true_filter = rentals.dishwasher(1)
    false_filter = rentals.dishwasher(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with central_air' do
    Rental.delete_all
    one = Rental.create!(amen_central_air: true)
    two = Rental.create!(amen_central_air: false)
    three = Rental.create!(amen_central_air: true)
    true_filter = rentals.central_air(1)
    false_filter = rentals.central_air(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with heater' do
    Rental.delete_all
    one = Rental.create!(amen_heater: true)
    two = Rental.create!(amen_heater: false)
    three = Rental.create!(amen_heater: true)
    true_filter = rentals.heater(1)
    false_filter = rentals.heater(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with gas' do
    Rental.delete_all
    one = Rental.create!(util_gas: true)
    two = Rental.create!(util_gas: false)
    three = Rental.create!(util_gas: true)
    true_filter = rentals.gas(1)
    false_filter = rentals.gas(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with electricity' do
    Rental.delete_all
    one = Rental.create!(util_electricity: true)
    two = Rental.create!(util_electricity: false)
    three = Rental.create!(util_electricity: true)
    true_filter = rentals.electricity(1)
    false_filter = rentals.electricity(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with trash' do
    Rental.delete_all
    one = Rental.create!(util_trash: true)
    two = Rental.create!(util_trash: false)
    three = Rental.create!(util_trash: true)
    true_filter = rentals.trash(1)
    false_filter = rentals.trash(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with water' do
    Rental.delete_all
    one = Rental.create!(util_water: true)
    two = Rental.create!(util_water: false)
    three = Rental.create!(util_water: true)
    true_filter = rentals.water(1)
    false_filter = rentals.water(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with TV' do
    Rental.delete_all
    one = Rental.create!(util_tv: true)
    two = Rental.create!(util_tv: false)
    three = Rental.create!(util_tv: true)
    true_filter = rentals.tv(1)
    false_filter = rentals.tv(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with wifi' do
    Rental.delete_all
    one = Rental.create!(util_wifi: true)
    two = Rental.create!(util_wifi: false)
    three = Rental.create!(util_wifi: true)
    true_filter = rentals.wifi(1)
    false_filter = rentals.wifi(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals that match the query' do
    Rental.delete_all
    one = Rental.create!(addr_full_adress: "chico")
    two = Rental.create!(addr_full_adress: "ch")
    three = Rental.create!(addr_full_adress: "LA")
    true_filter = rentals.search_query("ch")
    false_filter = rentals.search_query("not found")
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (0)
  end

  it 'should return only rentals with selected number of beds' do
    Rental.delete_all
    one = Rental.create!(dets_beds: 2)
    two = Rental.create!(dets_beds: 2)
    three = Rental.create!(dets_beds: 1)
    true_filter = rentals.beds(2)
    false_filter = rentals.beds(3)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (0)
  end

  it 'should return only rentals with selected number of baths' do
    Rental.delete_all
    one = Rental.create!(dets_baths: 2)
    two = Rental.create!(dets_baths: 2)
    three = Rental.create!(dets_baths: 1)
    true_filter = rentals.baths(2)
    false_filter = rentals.baths(3)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (0)
  end

  it 'should create full address' do
    Rental.delete_all
    one = Rental.create!(addr_street_num: 22, addr_street_name: "hello", addr_city: "Chico", addr_country: "USA")
    address = rentals.first.full_address
    true_address = "22 hello, Chico, USA"
    expect(address).to eq (true_address)
  end

  it 'should list the number of beds in order' do
    Rental.delete_all
    one = Rental.create!(dets_beds: 2)
    two = Rental.create!(dets_beds: 2)
    three = Rental.create!(dets_beds: 1)
    order = rentals.options_for_select_beds
    expect(order).to eq ([[1,3],[2,1],[2,2]])
  end

  it 'should list the number of baths in order' do
    Rental.delete_all
    one = Rental.create!(dets_baths: 2)
    two = Rental.create!(dets_baths: 2)
    three = Rental.create!(dets_baths: 1)
    order = rentals.options_for_select_baths
    expect(order).to eq ([[1,3],[2,1],[2,2]])
  end
end
