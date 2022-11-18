class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    
    respond_to do |format| # format will be html, json, csv, etc.
      if @review.save
        # We handle each response format differently
        format.html { redirect_to restaurant_path(@restaurant) } # standard behaviour that we want to keep
        format.json # by default, it looks for a reviews/create.json.jbuilder # jbuilder is the equivalent of ERB for JSON
      else
        format.html { render :new, status: :unprocessable_entity } # standard behaviour that we want to keep
        format.json
      end
    end
  end

  # # REMINDER: when we don't specify `render` or `redirect_to` at the end of an action
  # def show
  #   @review = Review.find(params[:id])

  #   # render :show # by default, looks for a reviews/show.html.erb file to render
  # end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
