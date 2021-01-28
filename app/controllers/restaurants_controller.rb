class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end
  
  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end
end
