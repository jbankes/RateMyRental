require 'test_helper'

class RentalsControllerTest < ActionController::TestCase
  setup do
    @rental = rentals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rentals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rental" do
    assert_difference('Rental.count') do
      post :create, rental: { addr_city: @rental.addr_city, addr_country: @rental.addr_country, addr_full_adress: @rental.addr_full_adress, addr_street_name: @rental.addr_street_name, addr_street_num: @rental.addr_street_num, addr_zip: @rental.addr_zip, amen_central_air: @rental.amen_central_air, amen_dishwasher: @rental.amen_dishwasher, amen_gym: @rental.amen_gym, amen_heater: @rental.amen_heater, amen_parking: @rental.amen_parking, amen_pets: @rental.amen_pets, amen_pool: @rental.amen_pool, amen_spa: @rental.amen_spa, amen_washer_dryer: @rental.amen_washer_dryer, dets_baths: @rental.dets_baths, dets_beds: @rental.dets_beds, dets_company_owned: @rental.dets_company_owned, dets_is_complex: @rental.dets_is_complex, dets_owner: @rental.dets_owner, dets_stories: @rental.dets_stories, util_electricity: @rental.util_electricity, util_gas: @rental.util_gas, util_trash: @rental.util_trash, util_tv: @rental.util_tv, util_water: @rental.util_water, util_wifi: @rental.util_wifi }
    end

    assert_redirected_to rental_path(assigns(:rental))
  end

  test "should show rental" do
    get :show, id: @rental
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rental
    assert_response :success
  end

  test "should update rental" do
    patch :update, id: @rental, rental: { addr_city: @rental.addr_city, addr_country: @rental.addr_country, addr_full_adress: @rental.addr_full_adress, addr_street_name: @rental.addr_street_name, addr_street_num: @rental.addr_street_num, addr_zip: @rental.addr_zip, amen_central_air: @rental.amen_central_air, amen_dishwasher: @rental.amen_dishwasher, amen_gym: @rental.amen_gym, amen_heater: @rental.amen_heater, amen_parking: @rental.amen_parking, amen_pets: @rental.amen_pets, amen_pool: @rental.amen_pool, amen_spa: @rental.amen_spa, amen_washer_dryer: @rental.amen_washer_dryer, dets_baths: @rental.dets_baths, dets_beds: @rental.dets_beds, dets_company_owned: @rental.dets_company_owned, dets_is_complex: @rental.dets_is_complex, dets_owner: @rental.dets_owner, dets_stories: @rental.dets_stories, util_electricity: @rental.util_electricity, util_gas: @rental.util_gas, util_trash: @rental.util_trash, util_tv: @rental.util_tv, util_water: @rental.util_water, util_wifi: @rental.util_wifi }
    assert_redirected_to rental_path(assigns(:rental))
  end

  test "should destroy rental" do
    assert_difference('Rental.count', -1) do
      delete :destroy, id: @rental
    end

    assert_redirected_to rentals_path
  end
end
