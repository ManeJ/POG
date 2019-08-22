const details = document.getElementById('details')
const x = document.getElementById("more");
if (x) {
  x.style.display = 'none'
  x.style.visibility = 'hidden';
  x.style.opacity = '0';
  details.addEventListener("click", () => {
    if (x.style.display === "none") {
      window.setTimeout(function () {
        x.style.display = "block";
        x.style.visibility = 'visible';
        x.style.opacity = '1';
      }, 100)
    } else {
      window.setTimeout(function () {
        x.style.display = "none";
        x.style.visibility = 'hidden';
        x.style.opacity = '0';
      }, 100)
    }
  })
}
