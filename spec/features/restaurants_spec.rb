require 'rails_helper'

describe 'restaurants' do 

	context 'when the DB is created and no restaurants have been added' do 
		it 'there should be an appropriate message and option to add restaurants on the home page' do
			visit '/restaurants'
			expect(page).to have_content("As yet we have no restaurants listed for this area")
			expect(page).to have_link("Add a restaurant")
		end
	end

	context 'when the DB contains restaurants' do 

		it 'they should be displayed on the homepage' do
			Restaurant.create(name: "Vanilla Black", cuisine: "Vegetarian")
			visit ('/restaurants')
			expect(page).to have_content('Vanilla Black')
		end

	end

	context 'users can add restaurants' do 

		it 'by following the "add restaurant" link which should lead to a form for adding resuarants' do
			visit ('/restaurants')
			click_link('Add a restaurant')
			expect(page).to have_content('Name')
			expect(page).to have_content('Cuisine')
		end

		it 'and then filling in the form' do
			add_restaurant
			expect(Restaurant.count).to eq(1)
			expect(page).to have_content("Vanilla Black")
		end

	end

	context 'restaurants can be' do 

		before(:each) {add_restaurant}

		it 'deleted' do
			visit ('/restaurants')
			expect(page).to have_content('Vanilla Black')
			click_link('Delete Vanilla Black')
			expect(page).not_to have_content('Vanilla Black')
		end

		it 'edited' do 
			visit ('/restaurants')
			expect(page).to have_content('Vanilla Black')
			click_link('Edit Vanilla Black')
			expect(page).to have_content('Name')
			fill_in 'Name', with: "The Gate"
			click_button 'Update Restaurant'
			expect(page).to have_content('The Gate')
			expect(page).not_to have_content('Vanilla Black')
		end

		it 'must know the average rating after a rating is left' do
			add_restaurant 
			leave_2_reviews
			restaurant = Restaurant.first
			expect(restaurant.average_rating).to eq(4)
		end

	end

end