# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
	$('#link_to_maps').click((e) ->
		e.preventDefault()
		$('#content').append('<div style="width: 450px; height: 400px;" id="map_canvas"></div>')
		$('#content').append('<input type="button" value="Return to my position" id="button_return"></input>')
		$('#link_to_maps').hide()
		myOptions = 
		    center: new google.maps.LatLng(44.59389, 33.529587)
		    zoom: 14
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		   
		map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
		infomarker = new google.maps.InfoWindow

		$.ajax(
		  url: "/places/get"
		  success: (data) ->
		    $(data).each( ->
		      $(this.sort_places).each( ->
		        marker = new google.maps.Marker(
		          position: new google.maps.LatLng(this.lat, this.long)
		          map: map
		          clickable: true
		        )

		        google.maps.event.addListener(marker, 'click', ->
		          geocoder = new google.maps.Geocoder()
		          geocoder.geocode('latLng': this.position, (results, status) ->
		            if (status == google.maps.GeocoderStatus.OK)

		              if (results[0])
		                if(infomarker) 
		                  infomarker.close()
		                infomarker = new google.maps.InfoWindow;
		                content_kofe = results[0].address_components[1].long_name + " " +  results[0].address_components[0].long_name
		                infomarker.setContent(content_kofe)
		                infomarker.open(map, marker)

		              else
		                alert("Geocoder failed due to: " + status)
		          )
		        )
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
          	latlng_val(marker_man.position.Ta, marker_man.position.Ua)
          )


          $('#button_return').click( ->
          	marker_man.setOptions(
          		position: initialLocation
          	)
          	map.setOptions(center: initialLocation)
          	latlng_val(position.coords.latitude, position.coords.longitude)
          )
        )
        
	)