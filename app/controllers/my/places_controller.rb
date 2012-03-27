# -*- encoding : utf-8 -*-
class My::PlacesController < ApplicationController

  before_filter :authenticate_user!

  def index
  	@categories = Category.all
  end

  def new
  	@place = Place.new

  	respond_to do |format|
  		format.html
  		format.json { render :json }
  	end
  end

  def create
  	@place = current_user.places.new(params[:place])
  	@place.save
  	redirect_to my_places_path
  end

  def get_places
  	@categories = Category.all

  	render :json => @categories, :include => :places
  end
  
end