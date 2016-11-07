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

    # it 'loads all of the rentals into @rentals' do
    #   rental1, rental2 = Rental.create!, Rental.create!
    #   get :index
    #
    #   expect(assigns(:rental)).to match_array([rental1, rental2])
    # end
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
        expect(review).to be_a_new(Review)
      end
    end
  end



end
