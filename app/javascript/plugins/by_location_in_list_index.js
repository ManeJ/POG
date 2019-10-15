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
          carouselContainer.insertAdjacentHTML("beforeend",
            `<div class='carousel-item ${ active }'>
              <div class="d-flex align-items-center justify-content-center">
                <div class="carousel-item-card d-flex flex-column justify-content-center align-items-center">
                  <h2 class="mb-0">${quest.title}</h2>
                  <p class="mb-3">${quest.mode} mode</p>
                  <p class="mb-3">On ${quest.when}</p>
                  <p class="font-italic text-center">${quest.desc}</p>
                  <a class="btn d-flex align-items-center justify-content-center" href="/quests/${quest.id}">More Details</a>
                </div>
              </div>
            </div>`);
          active = '';
        });
      });
  });
});

const input = document.querySelector(".mapboxgl-ctrl-geocoder--input");
