#encoding: utf-8

class Admin::GmapsController < ApplicationController

  def index
  	@coordinates = Coordinate.all
  end

  def new
  	@coordinate = Coordinate.new
  	respond_to do |format|
  		format.html
  		format.json {render :json => @coordinate}
  	end
  end

  def create
  	@coordinate = Coordinate.new(params[:coordinate])
  	@coordinate.save
  	redirect_to admin_gmaps_path
  end

  def destroy
    @coordinate = Coordinate.find(params[:id])
    if @coordinate.destroy
      redirect_to admin_gmaps_path, :notice => "Координаты были удалены"
    else
      redirect_to admin_gmaps_path, :notice => "Ошибка при удалении" 
    end
  end

end
