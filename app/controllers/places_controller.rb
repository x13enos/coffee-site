# -*- encoding : utf-8 -*-
class PlacesController < ApplicationController

  def index
  	@categories = Category.all
  end

  def get_places
  	@categories = Category.all

  	render :json => @categories, :include => :places
  end
  
end
