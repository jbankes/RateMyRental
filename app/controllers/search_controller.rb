class SearchController < ApplicationController
 
	def show
		@filterrific = initialize_filterrific(
			Rental,
			params[:filterrific],
			select_options: {
				beds: Rental.options_for_select_beds,
				baths: Rental.options_for_select_baths
      		}
  	) or return
		@rentals = @filterrific.find.page params[:page]

  	respond_to do |format|
		format.html
		format.js
		end
	end
end
