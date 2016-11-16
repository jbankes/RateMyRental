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
 
  it 'should return only rentals with whasher_dryer' do
    one = FactoryGirl.create(:rental,amen_washer_dryer: true)
    two = FactoryGirl.create(:rental,amen_washer_dryer: false)
    three = FactoryGirl.create(:rental,amen_washer_dryer: true)
    true_filter = rentals.washer_dryer(1)
    false_filter = rentals.washer_dryer(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with parking' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_parking: true)
    two = FactoryGirl.create(:rental,amen_parking: false)
    three = FactoryGirl.create(:rental,amen_parking: true)
    true_filter = rentals.parking(1)
    false_filter = rentals.parking(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with pets' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_pets: true)
    two = FactoryGirl.create(:rental,amen_pets: false)
    three = FactoryGirl.create(:rental,amen_pets: true)
    true_filter = rentals.pets(1)
    false_filter = rentals.pets(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with pool' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_pool: true)
    two = FactoryGirl.create(:rental,amen_pool: false)
    three = FactoryGirl.create(:rental,amen_pool: true)
    true_filter = rentals.pool(1)
    false_filter = rentals.pool(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with spa' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_spa: true)
    two = FactoryGirl.create(:rental,amen_spa: false)
    three = FactoryGirl.create(:rental,amen_spa: true)
    true_filter = rentals.spa(1)
    false_filter = rentals.spa(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with gym' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_gym: true)
    two = FactoryGirl.create(:rental,amen_gym: false)
    three = FactoryGirl.create(:rental,amen_gym: true)
    true_filter = rentals.gym(1)
    false_filter = rentals.gym(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with dishwasher' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_dishwasher: true)
    two = FactoryGirl.create(:rental,amen_dishwasher: false)
    three = FactoryGirl.create(:rental,amen_dishwasher: true)
    true_filter = rentals.dishwasher(1)
    false_filter = rentals.dishwasher(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with central_air' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_central_air: true)
    two = FactoryGirl.create(:rental,amen_central_air: false)
    three = FactoryGirl.create(:rental,amen_central_air: true)
    true_filter = rentals.central_air(1)
    false_filter = rentals.central_air(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with heater' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,amen_heater: true)
    two = FactoryGirl.create(:rental,amen_heater: false)
    three = FactoryGirl.create(:rental,amen_heater: true)
    true_filter = rentals.heater(1)
    false_filter = rentals.heater(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with gas' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,util_gas: true)
    two = FactoryGirl.create(:rental,util_gas: false)
    three = FactoryGirl.create(:rental,util_gas: true)
    true_filter = rentals.gas(1)
    false_filter = rentals.gas(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with electricity' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,util_electricity: true)
    two = FactoryGirl.create(:rental,util_electricity: false)
    three = FactoryGirl.create(:rental,util_electricity: true)
    true_filter = rentals.electricity(1)
    false_filter = rentals.electricity(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with trash' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,util_trash: true)
    two = FactoryGirl.create(:rental,util_trash: false)
    three = FactoryGirl.create(:rental,util_trash: true)
    true_filter = rentals.trash(1)
    false_filter = rentals.trash(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with water' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,util_water: true)
    two = FactoryGirl.create(:rental,util_water: false)
    three = FactoryGirl.create(:rental,util_water: true)
    true_filter = rentals.water(1)
    false_filter = rentals.water(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with TV' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,util_tv: true)
    two = FactoryGirl.create(:rental,util_tv: false)
    three = FactoryGirl.create(:rental,util_tv: true)
    true_filter = rentals.tv(1)
    false_filter = rentals.tv(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals with wifi' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,util_wifi: true)
    two = FactoryGirl.create(:rental,util_wifi: false)
    three = FactoryGirl.create(:rental,util_wifi: true)
    true_filter = rentals.wifi(1)
    false_filter = rentals.wifi(0)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (3)
  end

  it 'should return only rentals that match the query' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,addr_full_adress: "chico")
    two = FactoryGirl.create(:rental,addr_full_adress: "ch")
    three = FactoryGirl.create(:rental,addr_full_adress: "LA")
    true_filter = rentals.search_query("ch")
    false_filter = rentals.search_query("not found")
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (0)
  end

  it 'should return only rentals with selected number of beds' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,dets_beds: 2)
    two = FactoryGirl.create(:rental,dets_beds: 2)
    three = FactoryGirl.create(:rental,dets_beds: 1)
    true_filter = rentals.beds(2)
    false_filter = rentals.beds(3)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (0)
  end

  it 'should return only rentals with selected number of baths' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,dets_baths: 2)
    two = FactoryGirl.create(:rental,dets_baths: 2)
    three = FactoryGirl.create(:rental,dets_baths: 1)
    true_filter = rentals.baths(2)
    false_filter = rentals.baths(3)
    expect(true_filter.count).to eq (2)
    expect(false_filter.count).to eq (0)
  end

  it 'should create full address' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,addr_street_num: 22, addr_street_name: "hello", addr_city: "Chico", addr_country: "USA")
    address = rentals.first.full_address
    true_address = "22 hello, Chico, USA"
    expect(address).to eq (true_address)
  end

  it 'should list the number of beds in order' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,dets_beds: 2)
    two = FactoryGirl.create(:rental,dets_beds: 2)
    three = FactoryGirl.create(:rental,dets_beds: 1)
    order = rentals.options_for_select_beds
    expect(order).to eq ([[1,three.id],[2,one.id],[2,two.id]])
  end

  it 'should list the number of baths in order' do
    Rental.delete_all
    one = FactoryGirl.create(:rental,dets_baths: 2)
    two = FactoryGirl.create(:rental,dets_baths: 2)
    three = FactoryGirl.create(:rental,dets_baths: 1)
    order = rentals.options_for_select_baths
    expect(order).to eq ([[1,three.id],[2,one.id],[2,two.id]])
  end

end
