# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  def new
  	@user = User.new

  	respond_to do |format|

  		format.html
  		format.json {render :json}
  	end
  end

  def create
  	@user = User.new(params[:user])
    
  	if @user.save
      redirect_to home_path, :notice => "Пользователь успешно создан"
    else
      redirect_to new_user_path, :notice => "Ошибка, заполните правильно поля"
    end
  end

end
