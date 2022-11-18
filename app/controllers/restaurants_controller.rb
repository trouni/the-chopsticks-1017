class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  def chef
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    # this empty instance is for the form generator
    @restaurant = Restaurant.new
    # render 'new.html.erb'
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again if validations failed
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # this instance is for the form generator
    # render 'edit.html.erb'
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # Strong params -> we are filtering the attributes from the form
    # {"name"=>"Sukiya", "address"=>"Meguro", "rating"=>"2"}
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
