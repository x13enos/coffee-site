# -*- encoding : utf-8 -*-
class Admin::PlacesController < AdminController

  def index
    if params[:filter] == "untested_places"
  	  @places = Place.where('enable = ?', false)
    else
      get_category
      @places = @category.places
    end


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
    get_category
  	@place = @category.places.new(params[:place].merge(:enable => true), :without_protection => true)
    @place.save
  	redirect_to admin_category_places_path(@category.id)
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(params[:place], :without_protection => true)
    redirect_to :back
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.destroy
      redirect_to admin_places_path(:filter => 'untested_places'), :notice => "Координаты были удалены"
    else
      redirect_to admin_places_path(:filter => 'untested_places'), :notice => "Ошибка при удалении" 
    end
  end

  private

  def get_category
    @category = Category.find(params[:filter])
  end
end
