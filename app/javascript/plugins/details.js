const details = document.querySelectorAll('#details')
const xs = document.querySelectorAll("#more");

xs.forEach((x)=>{
  if (x) {
    x.style.display = 'none'
    x.style.visibility = 'hidden';
    x.style.opacity = '0';
    details.forEach((detail)=>{
      detail.addEventListener("click", () => {
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
    })
  }
})