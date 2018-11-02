class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show search]
  before_action :set_space, only: [:show]

  def index
    # @spaces = Space.search(params[:search])
    @spaces = policy_scope(Space).all
  end

  def show
    authorize @space
    @rental = Rental.new

    @markers = [
                {
                  lat: @space.latitude,
                  lng: @space.longitude,
                }
                ]
  end

  def edit
    @space = Space.find(params[:id])
    authorize @space
  end

  def update
    @space = Space.find(params[:id])
    authorize @space
    if @space.update(space_params)
      redirect_to @space, notice: "Space succesfully updated!"
    else
      render :edit
    end
  end

  def create
    @user = User.find(params[:user_id])
    @space = @user.spaces.new(space_params)
    authorize @space
    if @space.save
      redirect_to @user, notice: 'Your space was successfully created!'
    else
      render @user
    end
  end

  def search
    if params[:search].present?
      @spaces = Space.search_by_name_description_city_and_country(params[:search])
    else
      @spaces = Space.all
      # render :index
    end

    authorize @spaces
    @geo_spaces = Space.where.not(latitude: nil, longitude: nil)

    @markers = @spaces.map do |venue|
      if venue.latitude.present? && venue.longitude.present?
        {
          lat: venue.latitude,
          lng: venue.longitude,
        }
      end
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
