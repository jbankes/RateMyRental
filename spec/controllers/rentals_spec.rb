# Rentals Controller Spec
require 'rails_helper'
require 'rental'
require 'review'

RSpec.describe RentalsController, :type => :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'GET #new rentals ' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show rentals' do
    context 'it respondes successfully' do
      it 'responds with an HTTP 200 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context 'creates the correct objects' do
      it 'creates a new review object' do
	u = FactoryGirl.build :rental
        expect(u.reviews.new).to be_a_new(Review)
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new rental" do
	#Rental.delete_all
	u = FactoryGirl.build :rental
        post :create, rental: u.attributes
        expect(Rental.count).to eq(1)
      end
    end
    context "with unvalid attributes" do
      it "fail to create new rental" do
	#Rental.delete_all
	u = FactoryGirl.build :rental_invalid
	post :create, rental: u.attributes
        expect(response).to render_template(:new)
	end
    end

  end

  describe "PUT #update" do
    #Rental.delete_all
    let(:valid) do
      { :addr_street_num => 1000}
    end
    let(:invalid) do {:addr_full_adress => nil} end
    it 'update should redirect to rental page' do
      u = FactoryGirl.create :rental
      put :update, :id => u.id, :rental => valid
      u.reload
      expect(response).to redirect_to(u)
    end

    it 'should update rental' do
      u = FactoryGirl.create :rental
      put :update, id: u.id, rental: valid
      u.reload
      expect(u.addr_street_num).to eql valid[:addr_street_num]

      

    end
    it 'should fail updating rental' do
      u = FactoryGirl.create :rental
      put :update, :id => u.id, :rental => invalid
      u.reload
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the rental" do
      u = FactoryGirl.create(:rental)
      expect{
        delete :destroy, :id => u.id
      }.to change{Rental.count}.by(-1)
    end
    it "redirects to rentals#index" do
      u = FactoryGirl.create(:rental)
      delete :destroy, :id => u.id
      expect(response).to redirect_to(rentals_url)
    end
  end

  describe 'GET #show rentals' do
    it "redirects to rentals#show" do
      u = FactoryGirl.create(:rental)
      get :show, :id => u
      expect(response).to render_template(:show)
    end
    it 'creates a new review object' do
	u = FactoryGirl.build :rental
        expect(u.reviews.new).to be_a_new(Review)
    end
    it 'creates a new image object' do
	u = FactoryGirl.build :rental
        expect(u.images.new).to be_a_new(Image)
    end
  end

end
