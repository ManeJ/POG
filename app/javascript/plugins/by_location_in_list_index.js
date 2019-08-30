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
              <div class="contact-area">
                <div class="contact">
                  <main>
                    <div class="card-player-reviews">
                      <div class="content">
                        <aside>
                          <div class="d-flex flex-column justify-content-center align-items-center">
                            <h2 class="mb-0">${quest.title}</h2>
                            <p class="mb-5">${quest.mode}</p>
                            <p class="mb-5">On ${quest.when}</p>
                            <p class="font-italic">
                              <p>${quest.desc}</p>
                            </p>
                            <buton></buton>
                            <a class="text-white" href="/quests/${quest.id}">More Details</a>
                          </div>
                        </aside>
                      </div>
                    </div>
                  </main>
                </div>
              </div>
            </div>`);
          active = '';
        });
      });
  });
});

const input = document.querySelector(".mapboxgl-ctrl-geocoder--input");
