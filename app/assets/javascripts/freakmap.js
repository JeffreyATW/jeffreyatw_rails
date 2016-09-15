var _ = require('lodash');

window.initMap = function () {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.50, lng: -98.35},
    zoom: 4
  });

  _.forEach(gon.locations, function (location) {
    if (_.isNumber(location.longitude) && _.isNumber(location.latitude)) {
      var marker = new google.maps.Marker({
        map: map,
        position: {lat: location.latitude, lng: location.longitude},
        title: location.machines + ' @ ' + location.name
      });
    }
  });
};