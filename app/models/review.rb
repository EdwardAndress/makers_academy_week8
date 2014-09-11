class Review < ActiveRecord::Base

	validates :rating, inclusion: (1..5)
	validates :restaurant_id, presence: true
	validates :user_id, uniqueness: { scope: :restaurant_id, message: ' cannot review a restaurant more than once' }

  	belongs_to :restaurant
  	belongs_to :user
  	has_many :endorsements
  	has_many :negative_endorsements
end
