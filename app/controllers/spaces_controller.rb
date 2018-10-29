class SpacesController < ApplicationController
  def index
    @spaces = Spaces.all
  end

  def show
    @space = Space.find(params[:id])
  end
end
