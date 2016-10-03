class Rental < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :images, dependent: :destroy
end
