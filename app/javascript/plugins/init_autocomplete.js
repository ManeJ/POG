import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('quest_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
