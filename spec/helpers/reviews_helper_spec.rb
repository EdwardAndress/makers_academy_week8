require 'rails_helper'

def leave_2_reviews
	visit ('/restaurants')
	click_link('Review Vanilla Black')
	fill_in 'Comments', with: "Awesome!"
	select '5', from: 'Rating'
	click_button('Submit review')

	click_link ('Review Vanilla Black')
	fill_in 'Comments', with: "OK"
	select '3', from: 'Rating'
	click_button('Submit review')
end

def leave_3_reviews
	visit ('/restaurants')
	click_link('Review Vanilla Black')
	fill_in 'Comments', with: "Awesome!"
	select '5', from: 'Rating'
	click_button('Submit review')

	click_link ('Review Vanilla Black')
	fill_in 'Comments', with: "OK"
	select '3', from: 'Rating'
	click_button('Submit review')

	click_link ('Review Vanilla Black')
	fill_in 'Comments', with: "OK"
	select '2', from: 'Rating'
	click_button('Submit review')
end

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, :type => :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
