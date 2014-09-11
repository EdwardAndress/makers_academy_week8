class RestaurantsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.user = current_user


		if @restaurant.save
			redirect_to ('/restaurants')
		else
			render 'new'
		end
	end

	def edit
		@restaurant = current_user.restaurants.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = 'You are not authorised to edit this entry'
		redirect_to('/restaurants')
	end

	def update
		@restaurant = current_user.restaurants.find(params[:id])
		@restaurant.update(restaurant_params)

		redirect_to('/restaurants')
	end

	def destroy
		@restaurant = current_user.restaurants.find(params[:id])
		@restaurant.destroy
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = 'You are not authorised to delete this entry'
	ensure
		redirect_to ('/restaurants')
	end


	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :cuisine)
	end

end