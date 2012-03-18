# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  myOptions = 
    center: new google.maps.LatLng(44.59389, 33.529587)
    zoom: 11
    mapTypeId: google.maps.MapTypeId.ROADMAP
   
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)

  $.ajax(
    url: "places/get"
    success: (data) ->
      $(data).each( ->
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
                infomarker = new google.maps.InfoWindow;
                infomarker.close()
                content_kofe = results[0].address_components[1].long_name + " " +  results[0].address_components[0].long_name
                infomarker.setContent(content_kofe)
                infomarker.open(map, marker)
              else
                alert("Geocoder failed due to: " + status)
          )
        )

        navigator.geolocation.getCurrentPosition((position) ->
          initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude)
          marker_man = new google.maps.Marker(
            position: initialLocation
            map: map
            title: 'ваше местоположение'
            icon: "http://maps.google.com/mapfiles/kml/shapes/man.png"
            clickable: true
          )
        )
      )
  )