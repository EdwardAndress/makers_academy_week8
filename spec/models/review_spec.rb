require 'rails_helper'

RSpec.describe Review, :type => :model do

	it 'must be submitted with a rating' do
		review = Review.new()
		expect(review).to have(1).error_on(:rating)
	end

	it 'must be associated with a restaurant' do
		review = Review.new()
		expect(review).to have(1).error_on(:restaurant_id)
	end

end
