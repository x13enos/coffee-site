# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
	$('#link_to_maps').click((e) ->
		e.preventDefault()
		$('body').append('<div style="width: 450px; height: 400px;" id="map_canvas"></div>')
		$('body').append('<input type="button" value="Return to my position" id="button_return"></input>')
		$('#link_to_maps').hide()
		myOptions = 
		    center: new google.maps.LatLng(44.59389, 33.529587)
		    zoom: 14
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		   
		map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
		infomarker = new google.maps.InfoWindow

		$.ajax(
			url: '/admin/categorys/' + window.category_id + '/places.json'
			success: (data) ->
				$(data).each( ->
					marker = new google.maps.Marker(
			          position: new google.maps.LatLng(this.lat, this.long)
			          map: map
			          clickable: true
			        )
				)
		)

		latlng_val = (x, y) ->
          $('#lat').val(x)
          $('#lag').val(y)


		navigator.geolocation.getCurrentPosition((position) ->
          initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude)
          marker_man = new google.maps.Marker(
            draggable: true
            position: initialLocation
            map: map
            title: 'ваше местоположение'
            icon: "http://maps.google.com/mapfiles/kml/shapes/man.png"
            clickable: true
          )
          map.setOptions(center: initialLocation)
          latlng_val(position.coords.latitude, position.coords.longitude)
          
       
          google.maps.event.addListener(marker_man, 'dragend', ->
          	latlng_val(marker_man.position.Ua, marker_man.position.Va)
          )


          $('#button_return').click( ->
          	marker_man.setOptions(
          		position: initialLocation
          		map: map
          	)
          	map.setOptions(center: initialLocation)
          	latlng_val(position.coords.latitude, position.coords.longitude)
          )
        )
        
	)