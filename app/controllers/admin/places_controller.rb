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
    get_category
  	@place = Place.new
  	respond_to do |format|
  		format.html
  		format.json {render :json => @place}
  	end
  end

  def create
    @category = Category.find(params[:place][:category_id])
  	@place = @category.places.new(params[:place].merge(:enable => true), :without_protection => true)
    @place.save
  	redirect_to admin_places_path(:category_id => @category.id)
  end

  def edit 
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json }
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(params[:place], :without_protection => true)
    if params[:back_url] == 'untested_places'
      redirect_to admin_places_path(:filter => 'untested_places')
    else
      redirect_to admin_places_path(:category_id => @place.category_id)
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    if params[:back_url] == 'untested_places'
      redirect_to admin_places_path(:filter => 'untested_places')
    else
      redirect_to admin_places_path(:category_id => @place.category_id)
    end
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end
end
