class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spaces = @user.spaces
    @space = Space.new
  end
end
