import mapboxgl from "mapbox-gl"
import MapBoxGeocoder from '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder';
import { getCurrentPosition } from '@bouzuya/get-current-position';

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
    	const customizedMarker = document.createElement('div');
		  customizedMarker.className = 'marker';
		  customizedMarker.style.backgroundImage = `url('${marker.picture}')`;
		  customizedMarker.style.backgroundSize = 'contain';
		  customizedMarker.style.width = '25px';
		  customizedMarker.style.height = '25px';
    	new mapboxgl.Marker()
    	.setLngLat([ marker.lng, marker.lat ])
    	.setPopup(popup)
    	.addTo(map)
    })

      const main = async () => {
  const position1 = await getCurrentPosition({
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0,
  });

  new mapboxgl.Marker()


 
      .setLngLat([ position1.coords.longitude, position1.coords.latitude ])
      .addTo(map)
      
      const url = `${location.href}?lat=${position1.coords.latitude}&lng=${position1.coords.longitude}`;
      const currentUrl = new URL(window.location.href);

      if (!(currentUrl.searchParams.get('lat'))) {
        window.location = url;
      }
     
  
};
main();



    console.log(markers)

       fitMapToMarkers(map, markers)
  //   map.addControl(new MapBoxGeocoder({
  //     accessToken: mapboxgl.accessToken,
  //     mapboxgl: mapboxgl
  // }))
  }
}

export {initMapbox}