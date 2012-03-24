# -*- encoding : utf-8 -*-
class Admin::CoffeeTypesController < AdminController

	def index
		@coffee_types = CoffeeType.all
	end

	def new
		@coffeetype = CoffeeType.new

		respond_to do |format|
			format.html
			format.json { render json: @coffeetype }
		end
	end

	def create
		@coffeetype = CoffeeType.new(params[:coffee_type])
		@coffeetype.save
		redirect_to admin_coffee_types_path
	end

	def destroy
		@coffee_article = CoffeeType.find(params[:id])
		@coffee_article.destroy
		redirect_to admin_coffee_types_path
	end

end
