class Rental < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :images, dependent: :destroy

	geocoded_by :full_address
	after_validation :geocode

	filterrific(
  	#default_filter_params: { sorted_by: 'created_at_desc' },
  	available_filters: [
      :search_query,
    	:washer_dryer,
    	:parking,
			:beds
 	 ]
	)

	scope :search_query, lambda { |query|
		where("addr_full_adress LIKE ?", "%#{query}%") 
	}
	scope :washer_dryer, lambda { |washer_dryer|
    if washer_dryer == "0"
  		where(amen_washer_dryer: false)
		else
			where(amen_washer_dryer: true)
		end
	}
  scope :parking, lambda { |parking|
		if parking == "0"
			where(amen_parking: false)
		else
			where(amen_parking: true)
		end
	}
	scope :beds, lambda { |beds|
		where(dets_beds: [*beds])
	}

  # Search
	def self.search(search)
  		where("addr_full_adress LIKE ?", "%#{search}%") 
  end

  # Create address
	def full_address
		# street = addr_street_num.to_s + " " + addr_street_name
		[addr_street_num.to_s + " " + addr_street_name, addr_city, addr_country].compact.join(', ')
	end

	def self.options_for_select
	  order('LOWER(dets_beds)').map { |e| [e.dets_beds, e.id] }
	end
		

end
