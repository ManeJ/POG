
const details = document.getElementById('details')
const x = document.getElementById("more");
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

// details.addEventListener('click', function () {
//   var x = document.getElementById('x');
//   if (x.style.visibility == 'hidden') {
//     x.style.visibility = 'visible';
//     x.style.opacity = '1';
//   }
//   else {
//     x.style.visibility = 'hidden';
//     x.style.opacity = '0';
//   }

// });

// details.addEventListener('click', function () {
//   var ctr = 1;
//   x.className = x.className !== 'show' ? 'show' : 'hide';
//   if (x.className === 'show') {
//     x.style.display = 'block';
//     window.setTimeout(function () {
//       x.style.opacity = 1;
//       x.style.transform = 'scale(1)';
//     }, 0);
//   }
//   if (x.className === 'hide') {
//     x.style.opacity = 0;
//     x.style.transform = 'scale(0)';
//     window.setTimeout(function () {
//       x.style.display = 'none';
//     }, 200); // timed to match animation-duration
//   }

// });
