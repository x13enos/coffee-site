# -*- encoding : utf-8 -*-
module ApplicationHelper


	def title
		base_title = "Coffee Site"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def navigation_panel
	    paths = {
	      "Home" => "/home",
	      "Coffee Price" => "/price",
	      "Images" => "/images",
	      "Video" => "/video",
	      "Google Maps" => "/places",
        }

        a = "<div id='dl_link'>"
        paths.each {|key, value|
	      if request.path.include?(value) 
	        a += content_tag(:a, key, :href => value, :class => "first")
	      elsif request.path == "/" && value == "/home"
	      	a += content_tag(:a, key, :href => value, :class => "first")  
	      else
	      	a += content_tag(:a, key, :href => value, :class => "butt")
	  	  end
	    }
	    a += "</div>"
	    a.html_safe  
	end
end
