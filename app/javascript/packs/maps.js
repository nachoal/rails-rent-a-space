import GMaps from 'gmaps/gmaps.js';

const map = new GMaps({ el: '#map', lat: 0, lng: 0 });

const markMap = (markersJSON) => {
  if (!markersJSON[0]) return;
  var markers = markersJSON;
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const markers = JSON.parse(mapElement.dataset.markers);
  mapElement.component = map;
  mapElement.markMap = markMap;
  mapElement.markMap(markers);
}
