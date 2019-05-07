class ShowRatingsController < ApplicationController
  before_action :set_show_rating, only: [:show, :edit, :update, :destroy]
  #Authorization
  before_action :logged_in_any, only: [:show]
  before_action :logged_in_customer, only: [:create, :edit, :update, :destroy]

  # POST /show_ratings
  # POST /show_ratings.json
  def create
    @show_rating = ShowRating.new(show_rating_params)

    if @show_rating.save
      redirect_to @show_rating, notice: 'Show rating was successfully created.'
    else
      #render :new
      redirect_to @show_rating, notice: 'Show rating was not successfully created.'
    end
  end

  # PATCH/PUT /show_ratings/1
  # PATCH/PUT /show_ratings/1.json
  def update
    if @show_rating.update(show_rating_params)
      redirect_to @show_rating, notice: 'Show rating was successfully updated.'
    else
      #render :edit
      redirect_to @show_rating, notice: 'Show rating was not successfully updated.'
    end
  end

  # DELETE /show_ratings/1
  # DELETE /show_ratings/1.json
  def destroy
    @show_rating.destroy
    redirect_to show_ratings_url, notice: 'Show rating was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_rating
      @show_rating = ShowRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_rating_params
      params.require(:show_rating).permit(:rating, :show_id, :customer_id)
    end
end
