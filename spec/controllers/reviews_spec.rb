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

  # describe 'GET #show' do
  #   it 'responds succesfully with 200 status'do
  #   factory = FactoryGirl.create(:rental)
  #   review = factory.reviews.new
  #   get :show { id: factor}
  #   expect(response).to be_success
  #   expect(response).to have_http_status(200)
  #   end
  # end

  describe 'GET #new rental review'do
  it 'creates new review'do
  factory = FactoryGirl.create(:rental)
  review = factory.reviews.new
  expect(factory).to be_valid
  expect(review).to be_valid

  #  expect(factory).to be_a_new(rental.reviews.new)
  end
end

describe 'GET #create review'do
  it 'sets the new review to be live'do
    factory = FactoryGirl.create(:rental)
    # review = FactoryGirl.create.(:review)
    expect(factory).to be_valid
    # expect(review).to be_valid
  end
end
describe 'GET #destroy' do
  it'destroys a review successfully'do
    factory = FactoryGirl.create(:rental)
    response = factory.destroy()
    expect(response).to be_valid
  end
end

end
