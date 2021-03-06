import mapboxgl from "mapbox-gl"
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
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
      style: 'mapbox://styles/rodolfop/ck92sn75k2gw51imqq8xjgv2s'
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
        customizedMarker.style.border = '1px';
     	  new mapboxgl.Marker(customizedMarker)
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

       if (position1) { 
         const locationPin = document.createElement('div');
         locationPin.className = 'marker';
         locationPin.style.backgroundColor = 'red';
         locationPin.style.width = '12px';
         locationPin.style.height = '12px';
         locationPin.style.borderRadius = '6px'; 
         new mapboxgl.Marker(locationPin)
         .setLngLat([ position1.coords.longitude, position1.coords.latitude ])
         .addTo(map)
         const url = `${location.href}?lat=${position1.coords.latitude}&lng=${position1.coords.longitude}`;
         const currentUrl = new URL(window.location.href);
           if (!(currentUrl.searchParams.get('lat'))) {
             window.location = url;
           }  
        
          markers.push( { 
            lat: position1.coords.latitude,
            lng: position1.coords.longitude
          })

          fitMapToMarkers(map, markers)

        }
    };

    main();

    console.log(markers)
    fitMapToMarkers(map, markers)
  //   map.addControl(new MapboxGeocoder({
  //     accessToken: mapboxgl.accessToken,
  //     mapboxgl: mapboxgl
  // }))
  }
}

export {initMapbox}