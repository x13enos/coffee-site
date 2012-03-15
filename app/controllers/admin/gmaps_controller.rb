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

end
