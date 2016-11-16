# Reviews Controller Spec
require 'rails_helper'
require 'rental'

RSpec.describe ReviewsController, :type => :controller do
  include Devise::Test::ControllerHelpers
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

  #describe 'GET #new rental review'do
  #it 'creates new review'do
  #factory = FactoryGirl.create(:rental)
  #review = factory.reviews.new
  #expect(factory).to be_valid
  #expect(review).to be_valid

  #  expect(factory).to be_a_new(rental.reviews.new)
  #end
#end

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

  describe "POST #create" do
    Review.delete_all
    context "with valid attributes" do
      it "create new review" do
	u = FactoryGirl.build :review
        post :create, rental_id: u.rental.id ,review: u.attributes
        expect(Review.count).to eq(1)
      end
    end

  end

  describe "PUT #update" do
    let(:valid) do
      { :comment => "good"}
    end
    it 'update should redirect to review page' do
      u = FactoryGirl.create :review
      put :update, :id => u.id, :review => valid
      u.reload
      expect(response).to redirect_to(u)
    end

    it 'should update review' do
      u = FactoryGirl.create :review
      put :update, id: u.id, review: valid
      u.reload
      expect(u.comment).to eql valid[:comment]
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the review" do
      u = FactoryGirl.create(:review)
      expect{
        delete :destroy, :id => u.id
      }.to change{Review.count}.by(-1)
    end
    it "redirects to review#index" do
      u = FactoryGirl.create(:review)
      delete :destroy, :id => u.id
      expect(response).to redirect_to(reviews_url)
    end
  end

  describe 'GET #new' do
    it 'creates a new review object' do
      u = FactoryGirl.build :rental
      get :new, rental_id: u.id
      expect(u.reviews.new).to be_a_new(Review)
    end
  end
end
