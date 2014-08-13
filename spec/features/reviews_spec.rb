require 'rails_helper'

describe 'reviews' do 

	context 'users can leave reviews' do

		before do 
			Restaurant.create(name: "Vanilla Black", cuisine: "Vegetarian")
		end

		it 'using a form where they can write comments and select a rating from a drop down menu' do
			visit '/restaurants'
			click_link('Review Vanilla Black')
			expect(page).to have_content('Comments')
			fill_in 'Comments', with: "Awesome"
			select '5', from: 'Rating'
			click_button('Submit review')
			expect(page).to have_content('Awesome (★★★★★)')
		end

		it 'displays the average rating in stars' do
			leave_review("Good", 4)
			leave_review("Great", 5)

			expect(page).to have_content('Average rating: ★★★★★')
		end

	end

end