class RentalsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.space = @space
    if @rental.save
      redirect_to @rental, notice: 'Your rental was succesfully created!'
    else
      render "spaces/show"
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
