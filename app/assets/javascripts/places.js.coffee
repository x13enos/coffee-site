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
      )
  )
# $(function(){
# 	geocoder = new google.maps.Geocoder(); 
#     myposition = new google.maps.LatLng(44.581976,33.514451);
#     var myOptions = {
#         zoom: 12,
#         center: myposition,
#         mapTypeId: google.maps.MapTypeId.ROADMAP,
#     };
    
#      map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

#         marker_man = new google.maps.Marker({
#         draggable: true,
#         position: myposition,
#         map: map,
#         title: "моё местоположение",
# 		icon: "http://maps.google.com/mapfiles/kml/shapes/man.png",
#     });
    
#     google.maps.event.addListener(marker_man,"dragend", short_way);
# })