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
    FactoryGirl.create(:rental).should be_valid
  end
  let(:rentals) {Rental.all} 
  let(:washer_dryer) { rentals.where(amen_washer_dryer: true) }
  it 'should return only whasher_dryer' do
    expect(rental.to_sql).to eq (washer_dryer.to_sql)
  end

end
