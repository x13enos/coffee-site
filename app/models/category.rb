# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
	
	has_many :places, :dependent => :destroy

end
