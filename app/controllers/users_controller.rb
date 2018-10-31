class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @spaces = @user.spaces
    @space = Space.new
  end
end
