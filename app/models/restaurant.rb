class Restaurant < ActiveRecord::Base
	has_many :reviews
	belongs_to :user

	validates :name, uniqueness: true, length: { minimum: 3 }
	validates :cuisine, presence: true

	def average_rating
		return 'As yet this restaurant has not been reviewed' if reviews.none?
		reviews.inject(0)  do |sum, review| 
			sum + review.rating.to_f
		end / reviews.count
	end

end
