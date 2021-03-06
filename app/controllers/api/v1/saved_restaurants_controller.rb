class Api::V1::SavedRestaurantsController < ApplicationController

  def create
    @saved_restaurant = SavedRestaurant.new(saved_restaurant_params)
    if @saved_restaurant.save
      render json: @saved_restaurant
    else
      #do nothing
    end
  end

  def locate
    byebug
    @saved_restaurant = SavedRestaurant.find_by(user_id: saved_restaurant_params[:user_id],restaurant_id: saved_restaurant_params[:restaurant_id])

    if @saved_restaurant
      dishes = @saved_retaurant.dishes
      render json: @saved_restaurant
    end
  end

  def show
    @saved_restaurant = SavedRestaurant.find(params[:id])
    render json: @saved_restaurant
  end

  def index
    @saved_restaurants = SavedRestaurant.all
    render json: @saved_restaurants
  end

  def update
    #find by user id and restaurant id
    @saved_restaurant = SavedRestaurant.find(params[:id])

    if @saved_restaurant
      @saved_restaurant.update(restaurant_params)
      render json: @saved_restaurant
    else

    end
  end

  def find
    @saved_restaurant = SavedRestaurant.find_by(user_id: saved_restaurant_params[:user_id],restaurant_id: saved_restaurant_params[:restaurant_id])

    if @saved_restaurant
      @saved_restaurant.update(saved_restaurant_params)
      render json: @saved_restaurant
    end
  end

  def destroy
    @saved_restaurant = SavedRestaurant.find(params[:id])
    @saved_restaurant.destroy
  end

  private
  def saved_restaurant_params
    params.require(:saved_restaurant).permit(:user_id, :restaurant_id, :tried, :rating, :id)
  end
end
