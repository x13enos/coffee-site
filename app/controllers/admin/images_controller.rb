# -*- encoding : utf-8 -*-
class Admin::ImagesController < ApplicationController

  def index
  	@paintings = Painting.all
  end

  def new
	  	@painting = Painting.new

	  	respond_to do |format|
	  		format.html
	  		format.json { render json: @painting }
	  	end
  end

  def create
  		@painting = Painting.new(params[:painting])
  		@painting.save
  		redirect_to admin_images_path
  end

  def destroy
    @painting = Painting.find(params[:id])
    respond_to do |format|
      if @painting.destroy
        format.json {render :json =>{:status => 'ok'}}
      else
        format.json{render :json, :status => :unprocessable_entity}
      end
    end
  end

end
