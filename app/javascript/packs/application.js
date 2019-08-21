import "bootstrap";
import "../plugins/flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

initAutocomplete();
initMapbox();

// $('button').click(function () {
//   $('button').toggleClass('active');
//   $('.title').toggleClass('active');
//   $('nav').toggleClass('active');
// });

document.querySelectorAll("button").forEach((btn) => {
  btn.addEventListener("click", (event) => {
    console.dir(event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1]);
    event.currentTarget.classList.toggle("active");
    event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1].children[0].classList.toggle("active");
    event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1].children[1].classList.toggle("active");
    event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1].children[2].classList.toggle("active");
  });
});
