# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  myOptions = 
    center: new google.maps.LatLng(44.59389, 33.529587)
    zoom: 13
    mapTypeId: google.maps.MapTypeId.ROADMAP
   
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
  infomarker = new google.maps.InfoWindow

  $.ajax(
    url: "places/get"
    success: (data) ->
      $(data).each( ->
        array_marker = []
        $(this.places).each( ->
          marker = new google.maps.Marker(
            position: new google.maps.LatLng(this.lat, this.long)
            map: map
            clickable: true
            visible: false
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
          array_marker.push(marker)
        )
        $('input:checkbox[id = "'+this.id+'"]').click( ->
          if (this.checked == true)
            $(array_marker).each( -> this.setOptions visible: true)
          else
            $(array_marker).each( -> this.setOptions visible: false)
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