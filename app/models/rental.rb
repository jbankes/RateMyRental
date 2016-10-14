class Rental < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :images, dependent: :destroy


	def self.search(search)
  		where("addr_full_adress LIKE ?", "%#{search}%") 
	end

end
