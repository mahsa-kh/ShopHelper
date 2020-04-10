import mapboxgl from "mapbox-gl"

const initMapbox = () => {
  console.log("Hello MapBox")

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  const mapElement = document.getElementById("map");
  console.log(mapElement);
  if (mapElement) {
  	mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers)
    markers.forEach(marker => {
    	const popup = new mapboxgl.Popup().setHTML(marker.infoWindow)
    	new mapboxgl.Marker()
    	.setLngLat([ marker.lng, marker.lat ])
    	.setPopup(popup)
    	.addTo(map)
    })
    console.log(markers)

    fitMapToMarkers(map, markers)
  }
}

export {initMapbox}