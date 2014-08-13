class NegativeEndorsementsController < ApplicationController
	
	def create
		@review = Review.find(params[:review_id])
		@review.negative_endorsements.create

		render json: { new_negative_endorsement_count: @review.negative_endorsements.count }
	end
end
