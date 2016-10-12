class SearchController < ApplicationController
  def new
    @rentals = Rental.all

  end

  def create
    if params[:search]
    @rentals = Rental.search(params[:search])
  end
end
