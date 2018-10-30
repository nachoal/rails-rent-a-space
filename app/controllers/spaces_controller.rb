class SpacesController < ApplicationController
  # comment
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @rental = Rental.new
  end

  private

  def space_params
  params.require(:space).permit(:address, :city, :country, :capacity, :description, :price, :photo)
  end
end
