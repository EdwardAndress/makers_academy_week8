require 'rails_helper'

describe 'reviews' do 

	context 'users can leave reviews' do

		before do
			eddie = User.create(email: 'eddie_andress@hotmail.com', password: '12345678', password_confirmation: '12345678')
			login_as(eddie) 
			eddie.restaurants.create(name: "Vanilla Black", cuisine: "Vegetarian")
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
			edward = User.create(email: 'edward@edward.com', password: '12345678', password_confirmation: '12345678' )
			login_as(edward)
			leave_review("Great", 5)

			expect(page).to have_content('Average rating: ★★★★★')
		end

		it 'only once for each restaurant' do 
			leave_review('Amazing', 5)
			leave_review('Overpriced', 2)
			expect(page).to have_content('User cannot review a restaurant more than once')
		end

	end

end