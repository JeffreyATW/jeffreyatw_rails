//= require 'lodash'

var map, geocoder;
var initMap = function () {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.50, lng: -98.35},
    zoom: 4
  });
  geocoder = new google.maps.Geocoder();

  _.forEach(gon.crawl.states, function (state) {
    var stateName = state.name;
    _.chain(state).get('cities[0].cities').rest().forEach(function (location) {
      var name = location.name;
      var city = location.city;
      var version = location.version;

      geocoder.geocode({address: name + ', ' + city + ', ' + stateName}, function (results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
          var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            title: version + ' @ ' + name
          });
        }
      });
    }).value();
  });
};