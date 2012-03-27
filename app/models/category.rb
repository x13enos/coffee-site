# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
	
	has_many :places, :dependent => :destroy

  def as_json(args = {})
    super(args)
  end

  def sort_places
    places.where("enable = ?", true)
  end

end
