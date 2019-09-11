import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/details'
import '../plugins/display_list_or_map'
import '../plugins/by_location_in_list_index'
import { initAutocomplete } from '../plugins/init_autocomplete';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initAutocomplete();
initMapbox();


document.querySelectorAll(".action-btn").forEach((btn) => {
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

// BOUTONS CALL FOR ACTION HOMEPAGE
$(function(){
  $(".fancy-button").mousedown(function(){
    $(this).bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(){
        $(this).removeClass('active');
    })
     $(this).addClass("active");
  });
});

$(function(){
  $(".fancy-button2").mousedown(function(){
    $(this).bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(){
        $(this).removeClass('active');
    })
     $(this).addClass("active");
  });
});

//

function scrollLastMessageIntoView() {
  const messages = document.querySelectorAll('.message');
  const lastMessage = messages[messages.length - 1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}



