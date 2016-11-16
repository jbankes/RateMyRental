class Rental < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :images, dependent: :destroy

        validates :addr_full_adress, presence: true

	geocoded_by :full_address
	after_validation :geocode

	filterrific(
  	#default_filter_params: { sorted_by: 'created_at_desc' },
  		available_filters: [
			:search_query, :washer_dryer, :parking, :beds, :baths,
			:pets, :pool, :spa, :gym, :dishwasher, :central_air,
			:heater, :gas,	:electricity, :trash, :water, :tv, :wifi
 		]
	)

  # Search
	scope :search_query, lambda { |query|
		where("addr_full_adress LIKE ?", "%#{query}%") 
	}
	scope :washer_dryer, lambda { |washer_dryer|
		return if 0 == washer_dryer
		where(amen_washer_dryer: true)
	}
	scope :parking, lambda { |parking|
		return  if 0 == parking
		where(amen_parking: true)
	}
	scope :beds, lambda { |beds|
		where(dets_beds: [*beds])
	}
	scope :baths, lambda { |baths|
		where(dets_baths: [*baths])
	}
	scope :pets, lambda { |pets|
		return   if 0 == pets
		where(amen_pets: true)
	}
	scope :pool, lambda { |pool|
		return   if 0 == pool
		where(amen_pool: true)
	}
	scope :spa, lambda { |spa|
		return   if 0 == spa
		where(amen_spa: true)
	}
	scope :gym, lambda { |gym|
		return nil  if 0 == gym
		where(amen_gym: true)
	}
	scope :dishwasher, lambda { |dishwasher|
		return nil  if 0 == dishwasher
		where(amen_dishwasher: true)
	}
	scope :central_air, lambda { |central_air|
		return nil  if 0 == central_air
		where(amen_central_air: true)
	}
	scope :heater, lambda { |heater|
		return nil  if 0 == heater
		where(amen_heater: true)
	}
	scope :gas, lambda { |gas|
		return nil  if 0 == gas
		where(util_gas: true)
	}
	scope :electricity, lambda { |electricity|
		return nil  if 0 == electricity
		where(util_electricity: true)
	}
	scope :trash, lambda { |trash|
		return nil  if 0 == trash
		where(util_trash: true)
	}
	scope :water, lambda { |water|
		return nil  if 0 == water
		where(util_water: true)
	}
	scope :tv, lambda { |tv|
		return nil  if 0 == tv
		where(util_tv: true)
	}
	scope :wifi, lambda { |wifi|
		return nil  if 0 == wifi
		where(util_wifi: true)
	}

  # Create address
	def full_address
		# street = addr_street_num.to_s + " " + addr_street_name
		if addr_street_num != nil && addr_street_name !=nil
		  [addr_street_num.to_s + " " + addr_street_name, addr_city, addr_country].compact.join(', ')
		end
	end

	def self.options_for_select_beds
	  order('LOWER(dets_beds)').map { |e| [e.dets_beds, e.id] }
	end

	def self.options_for_select_baths
	  order('LOWER(dets_baths)').map { |e| [e.dets_baths, e.id] }
	end
		

end
