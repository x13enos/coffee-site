# -*- encoding : utf-8 -*-
class Admin::CategoriesController < AdminController

  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new

  	respond_to do |format|
  		format.html
  		format.json {render :json}
  	end
  end

  def create
  	@category = Category.new(params[:category])
  	@category.save
  	redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end
end
