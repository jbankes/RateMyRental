# Reviews Controller Spec
require 'rails_helper'
require 'rental'

RSpec.describe ReviewsController, :type => :controller do
  describe 'GET #index' do
    it 'responds successfully with 200 status' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'GET #show' do
    it 'responds succesfully with 200 status'do
    get :show
    expect(response).to be_success
    expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new rental review'do
  it 'creates new review'do
    get :new
    FactoryGirl.create(:rental).should_be_valid
    rental.reviews.new
  
    expect(response).to be_a_new(rental.reviews.new)
  end
end


end
