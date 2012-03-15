class PagesController < ApplicationController

  def home
    @title = "Home"
  end

  def price
    @title = "Coffee Price"
    @coffee_articles = CoffeeType.all
  end

  def images
    @title = "Images"
  end

  def video
    @title = "Video"
  end

  def gmaps
    @title = "Google maps"
  end
  
end
