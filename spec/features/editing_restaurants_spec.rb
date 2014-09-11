require 'rails_helper'

describe 'editing restaurants' do 

	before do
		@eddie = User.create(email: 'eddie_andress@hotmail.com', password: '12345678', password_confirmation: '12345678')
		@eddie.restaurants.create(name: 'Vanilla Black', cuisine: 'Vegetarian')
		@another = User.create(email: 'another@user.com', password: '12345678', password_confirmation: '12345678')
	end

	context 'the user responsible for creating a restaurant entry can' do 

		before(:each) {login_as(@eddie)}

		it 'delete' do
			visit ('/restaurants')
			expect(page).to have_content('Vanilla Black')
			click_link('Delete Vanilla Black')
			expect(page).not_to have_content('Vanilla Black')
		end

		it 'edit' do 
			visit ('/restaurants')
			expect(page).to have_content('Vanilla Black')
			click_link('Edit Vanilla Black')
			expect(page).to have_content('Name')
			fill_in 'Name', with: "The Gate"
			click_button 'Update Restaurant'
			expect(page).to have_content('The Gate')
			expect(page).not_to have_content('Vanilla Black')
		end
	end

	context 'users cannot' do

		before(:each) {login_as(@another)}

		it 'edit restaurants they did not create' do
			visit ('/restaurants')
			click_link('Edit Vanilla Black')
			expect(page).to have_content('You are not authorised to edit this entry') 
		end

		it 'delete restaurants they did not create' do
			visit ('/restaurants')
			click_link('Delete Vanilla Black')
			expect(page).to have_content('You are not authorised to delete this entry') 
		end

	end

end