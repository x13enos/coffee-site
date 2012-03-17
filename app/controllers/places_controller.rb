class PlacesController < ApplicationController

  def index
  end

  def get_places
  	@places = Place.all

  	render :json => @places
  end
  
end
