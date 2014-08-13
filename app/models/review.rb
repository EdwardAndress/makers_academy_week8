class Review < ActiveRecord::Base

	validates :rating, inclusion: (1..5)
	validates :restaurant_id, presence: true

  	belongs_to :restaurant
  	has_many :endorsements
end
