require 'rails_helper'

describe 'endorsing reviews' do 

	before do 
		kfc = Restaurant.create(name: 'KFC', cuisine: 'Fast food')
		kfc.reviews.create(comments: 'OK', rating: 3)
	end

	it 'can endorse reviews, updating the review details', js: true  do 
		visit '/restaurants'
		click_link('Endorse')
		expect(page).to have_content('1 endorsement')
	end


end