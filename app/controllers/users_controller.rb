class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spaces = @user.spaces
  end
end
