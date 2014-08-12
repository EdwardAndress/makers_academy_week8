require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	
	it 'is valid with a unique name of > 2 characters, starting with a capital letter' do
	restaurant = Restaurant.new(name: 'The Gate')
	expect(restaurant).to have(:no).errors_on(:name)
	end

	it 'is invalid with a non unique name' do
	Restaurant.create(name: 'The Gate')
	restaurant = Restaurant.new(name: 'The Gate')
	expect(restaurant).to have(1).error_on(:name)
	end

	it 'is invalid with a name < 3 characters' do
	restaurant = Restaurant.new(name: 'ZK')
	expect(restaurant).to have(1).error_on(:name)
	end

end
