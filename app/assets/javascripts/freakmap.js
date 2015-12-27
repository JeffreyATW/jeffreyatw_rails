//= require 'lodash'

var map, geocoder;
var initMap = function () {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.50, lng: -98.35},
    zoom: 4
  });
  geocoder = new google.maps.Geocoder();

  _.forEach(gon.locations, function (location) {
    var marker = new google.maps.Marker({
      map: map,
      position: {lat: location.latitude, lng: location.longitude},
      title: location.machines + ' @ ' + location.name
    });
  });
};