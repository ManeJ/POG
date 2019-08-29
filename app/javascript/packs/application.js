import "bootstrap";
import "../plugins/flatpickr";
import '../plugins/details';
import '../plugins/display_list_or_map';
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


const collapseBtns = document.querySelectorAll(".toggler-example");
collapseBtns.forEach((btn) => {
  btn.addEventListener("click", (event) => {
    const carouselContainer = event.currentTarget.parentElement.parentElement.children[1].children[0].children[0];
    const input = document.querySelector(".mapboxgl-ctrl-geocoder--input");
    const categoryId = event.currentTarget.dataset.categoryid;
    let query = "empty";
    if (input.value) { query = input.value; }
    const url = `../../category/${categoryId}/quests/filter-by-category/${query}`;
    fetch(url, { credentials: "include"})
      .then(response => response.json())
      .then((quests) => {
        carouselContainer.innerHTML = "";
        let active = 'active';
        quests.forEach((quest) => {
          carouselContainer.insertAdjacentHTML("beforeend", `<div class='carousel-item ${ active }'>${quest.title} : ${quest.desc} |
                                                              ${quest.mode} | ${quest.when}</div>`);
          active = '';
        });
      });

  });
});







