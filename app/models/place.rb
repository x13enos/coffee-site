# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base

	belongs_to :category
	belongs_to :user

	attr_protected :enable


end
