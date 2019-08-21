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

$('.button2').click(function () {
  var buttonId = $(this).attr('id');
  $('#modal-container').removeAttr('class').addClass(buttonId);
  $('body').addClass('modal-active');
})

$('#modal-container').click(function () {
  $(this).addClass('out');
  $('body').removeClass('modal-active');
});
