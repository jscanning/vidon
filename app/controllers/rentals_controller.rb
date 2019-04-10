class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @rental[:customer_id] = current_person.user.id
    session[:return_to] ||= request.referer
    
    if @rental.save
      redirect_to session.delete(:return_to), notice: 'Movie rental was successfully created.'
    else
      redirect_to session.delete(:return_to), notice: 'Movie rental failed to be created.'
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:movie_id)
    end
end