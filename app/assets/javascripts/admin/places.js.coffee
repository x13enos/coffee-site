# -*- encoding : utf-8 -*-
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
	$('body').append('<div style="width: 450px; height: 400px;" id="map_canvas"></div>')
	$('body').append('<input type="button" value="Return position" id="button_return"></input>')
	$('#link_to_maps').hide()
	myOptions = 
		center: new google.maps.LatLng(44.59389, 33.529587)
		zoom: 14
		mapTypeId: google.maps.MapTypeId.ROADMAP
		   
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
	infomarker = new google.maps.InfoWindow

	$.ajax(
		url: document.location.pathname + '.json'
		success: (data) ->
			$(data).each( ->
				initialLocation = new google.maps.LatLng(this.lat, this.long)
				marker = new google.maps.Marker(
				  position: initialLocation
				  map: map
				  clickable: true
				  draggable: true
			    )

				latlng_val = (x, y) ->
			        $('#lat').val(x)
			        $('#lag').val(y)
			       
			    google.maps.event.addListener(marker, 'dragend', ->
			        latlng_val(marker.position.Ta, marker.position.Ua)
			    )


			    $('#button_return').click( ->
			        marker.setOptions(position: initialLocation)
			        map.setOptions(center: initialLocation)
			        console.log(initialLocation)
			        latlng_val(initialLocation.Ta, initialLocation.Ua)
			    )
			)
	)