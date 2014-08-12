class Restaurant < ActiveRecord::Base
	has_many :reviews

	def average_rating
		ratings = self.reviews.map {|review| review.rating}
		total = ratings.inject {|sum, rating| sum + rating}
		total / ratings.count if total
	end

end
