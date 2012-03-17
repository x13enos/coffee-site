#encoding: utf-8

class Admin::PlacesController < ApplicationController

  def index
  	@place = Place.all
  end

  def new
  	@place = Place.new
  	respond_to do |format|
  		format.html
  		format.json {render :json => @place}
  	end
  end

  def create
  	@place = Place.new(params[:place])
  	@place.save
  	redirect_to admin_places_path
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.destroy
      redirect_to admin_places_path, :notice => "Координаты были удалены"
    else
      redirect_to admin_places_path, :notice => "Ошибка при удалении" 
    end
  end

end
