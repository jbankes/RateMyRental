# Review Controller Spec
require 'rails_helper'

RSpec.describe ImagesController, :type => :controller do

  describe 'GET #index ' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  #describe 'GET #new ' do
  #  it 'returns new image for rental' do
    #  context 'with no parameters' do
    #    it 'has no images' do
    #      repsonse = Rental.new
    #    end
    #  end
      #expect(@image).to be_an_instance_of Image
      #expect(repsonse).to be_an_instance_of Image
  #    expect(response).to be_success
  #    expect(response).to have_http_status(200)
  #  end
  #end

  #describe 'GET #show 'do
  #  it 'responds successfully with an HTTP 200 status code' do
  #    get :show
  #    expect(response).to be_success
  #    expect(response).to have_http_status(200)
  #  end
  #end

  #describe 'GET #set_image ' do
  #  it 'responds successfully with an HTTP 200 status code' do
  #    get :set_image
  #    { :get => "/" }.should route_to(:controller => "ImagesController", :action => "set_image")
  #    expect(response).to be_success
  #    expect(response).to have_http_status(200)
#
#    end
#  end

  #describe 'GET #image_params' do
  #  it 'responds successfully with an HTTP 200 status code' do
  #    get :image_params
  #    expect(response).to be_success
  #    expect(response).to have_http_status(200)
#
#    end
#  end


end
