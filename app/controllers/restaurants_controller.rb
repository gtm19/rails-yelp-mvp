class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show]
  before_action :get_categories
  
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end
  
  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  def get_categories
    @categories = Restaurant.categories
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
