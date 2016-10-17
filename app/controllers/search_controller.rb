class SearchController < ApplicationController
 
  def show
    if params[:search]
    @rentals = Rental.search(params[:search])
    end
    render `search/show`
  end
end
