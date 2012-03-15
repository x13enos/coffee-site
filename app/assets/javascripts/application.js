// JavaScript Document
//= require jquery
//= require jquery-ui
//= require jquery_ujs

$(function(){
	
	$('.destroy_icon').live('click', function(e){
		e.preventDefault();
		var image = $(e.target).parent().next();
		var container = $(image).parent();
		$.ajax({
			url: "/admin/images/" + $(image).attr('id'),
			type: 'DELETE',
			success: function(){
				$(container).fadeTo('slow', 0, function(){$(container).hide()})
			},
			error: function(){
				alert("Ошибка!")
			}
		})
	})

})