class SpacesController < ApplicationController
  # comment
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @space = @user.spaces.new(space_params)
    if @space.save
      redirect_to @user, notice: 'Your space was succesfully created!'
    else
      render @user
    end
  end

  private

  def space_params
    params.require(:space).permit(:address, :city, :country,
                                  :capacity, :description, :price, :photo)
  end
end
