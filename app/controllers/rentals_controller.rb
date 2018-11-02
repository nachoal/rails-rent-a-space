class RentalsController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    authorize @rental
    @rental.space = @space
    calculate_days
    @rental.price = calculate_price
    if @rental.save
      redirect_to @rental.user, notice: 'Your rental was sexyfully created!'
    else
      render 'spaces/show'
    end
  end

  private

  def calculate_days
    @total_days = @rental.end_date - @rental.start_date
    @total_days = @total_days.to_i
  end

  def calculate_price
    @total_price = @total_days * @space.price
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
