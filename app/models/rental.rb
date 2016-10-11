class Rental < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :images, dependent: :destroy

	geocoded_by :full_address
	after_validation :geocode

	def full_address
		# street = addr_street_num.to_s + " " + addr_street_name
		[addr_street_num.to_s + " " + addr_street_name, addr_city, addr_country].compact.join(', ')
	end

end
