class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spaces = @user.spaces
    @space = @user.spaces.new
  end

  private

  def space_params
    params.require(:space).permit(:address, :city, :country,
                                 :capacity, :description, :price, :photo)
  end
end
