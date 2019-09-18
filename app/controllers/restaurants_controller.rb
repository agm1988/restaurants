class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :show, :rate]

  def index
    @restaurants = RestaurantsSearchService.call(params)
  end

  def show

  end

  def rate
    @restaurant.ratings.create(rate: params[:rating])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.includes(:ratings).find(params[:id])
  end

  def restaurant_params
    params
      .require(:restaurant)
      .permit(:name, :description, :cousine, :logo, :is_open,
              working_hours_attributes: [:week_day, :start_time, :end_time])
  end

end
