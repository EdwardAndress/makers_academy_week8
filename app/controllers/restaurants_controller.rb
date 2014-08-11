class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		@restaurant.save
		redirect_to ('/restaurants')
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to ('/restaurants')
	end


	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :cuisine)
	end

end