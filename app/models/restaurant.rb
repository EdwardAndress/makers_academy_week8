class Restaurant < ActiveRecord::Base
	has_many :reviews

	def average_rating
			ratings = self.reviews.map {|review| review.rating}
			total = ratings.inject {|sum, rating| sum + rating}
			ave = total.round(2) / ratings.count if total
			ave.round(1) if ave
	end

end
