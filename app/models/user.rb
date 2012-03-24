class User < ActiveRecord::Base

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true,
					 :length => { :maximum => 20 } 
	
	validates :email, :presence => true,
					  :format => { :with => email_regex },
					  :uniqueness => { :case_sensitive => false }

end
