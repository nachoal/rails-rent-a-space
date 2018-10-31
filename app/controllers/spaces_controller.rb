class SpacesController < ApplicationController
  before_action :set_space, only: [:show]

  def index
    @spaces = Space.search(params[:search])
  end

  def show
    @rental = Rental.new
  end

  def create
    @user = User.find(params[:user_id])
    @space = @user.spaces.new(space_params)
    if @space.save
      redirect_to @user, notice: 'Your space was successfully created!'
    else
      render @user
    end
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:name, :address, :city, :country,
                                  :capacity, :description, :price, :photo, :search)
  end
end
