class SpacesController < ApplicationController
  # comment
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @rental = Rental.new
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to @flat, notice: "Flat succesfully updated!"
    else
      render :edit
    end
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
    params.require(:space).permit(:name, :address, :city, :country,
                                  :capacity, :description, :price, :photo)
  end
end
