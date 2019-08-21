import "bootstrap";
import "../plugins/flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

initAutocomplete();
initMapbox();

$('button').click(function () {
  $('button').toggleClass('active');
  $('.title').toggleClass('active');
  $('nav').toggleClass('active');
});


// CODE FOR FLIPPING EFFECT (card questmaster/quests#show)
$(".flipper").click(function() {
  var target = $( event.target );
  if ( target.is("a") ) {
    return true;
  } else {
    $(this).toggleClass("flip");
  }
  return false;
});
