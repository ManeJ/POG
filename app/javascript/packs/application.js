import "bootstrap";
import "../plugins/flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '../plugins/details'

initAutocomplete();
initMapbox();

document.querySelectorAll("button").forEach((btn) => {
  btn.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
    event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1].children[0].classList.toggle("active");
    event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1].children[1].classList.toggle("active");
    event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1].children[2].classList.toggle("active");
    event.currentTarget.parentElement.parentElement.parentElement.parentElement.children[1].children[3].classList.toggle("active");
  });
});

$('.button2').click(function () {
  var buttonId = $(this).attr('id');
  $('#modal-container').removeAttr('class').addClass(buttonId);
  $('body').addClass('modal-active');
})

$('#modal-container').click(function () {
  $(this).addClass('out');
  $('body').removeClass('modal-active');
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
