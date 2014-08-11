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
			Restaurant.create(name: "Vanilla Black")
			visit ('/restaurants')
			expect(page).to have_content('Vanilla Black')
		end

	end

end