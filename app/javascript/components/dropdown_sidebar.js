const initDropDown = () => {
  document.querySelectorAll(".dropdown-sidebar").forEach((band) => {
    band.addEventListener("click", (event) => {
      event.currentTarget.childNodes[1].classList.toggle("rotate-arrow");
      const songs = event.currentTarget.nextElementSibling;
      const songsLine = songs.querySelectorAll("li");
      songsLine.forEach((song) => {
        song.classList.toggle("d-none");
      });
    });
  });
};

export { initDropDown };
