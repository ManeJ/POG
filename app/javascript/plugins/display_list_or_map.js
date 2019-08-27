//import { initMapbox } from 'init_mapbox';

const display_map = document.getElementById('map-display');
const display_list = document.getElementById('list-display');
const map = document.getElementById('map');
const list = document.getElementById('list');

if (map) {
  //initMapbox()
  map.style.display = "block";
  display_map.addEventListener("click", () => {
      window.setTimeout(function () {
        list.style.display = "none";
        //initMapbox()
        map.style.display = "block";
      }, 100)
  })
  }

if (list) {
  display_list.addEventListener("click", () => {
      window.setTimeout(function () {
         map.style.display = " none";
        list.style.display = "block";
      }, 100)
  })
}


