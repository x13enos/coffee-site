# -*- encoding : utf-8 -*-
class Admin::PlacesController < AdminController
  before_filter :get_category

  def index
  	@places = Place.where('category_id = ?', @category.id)

    respond_to do |format|

      format.html
      format.json {render :json => @places}
    end
  end

  def show
  end

  def new
  	@place = Place.new
  	respond_to do |format|
  		format.html
  		format.json {render :json => @place}
  	end
  end

  def create
  	@place = @category.places.new(params[:place])
  	@place.save
  	redirect_to admin_category_places_path(@category.id)
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.destroy
      redirect_to admin_category_places_path(@category.id), :notice => "Координаты были удалены"
    else
      redirect_to admin_category_places_path(@category.id), :notice => "Ошибка при удалении" 
    end
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end


end
