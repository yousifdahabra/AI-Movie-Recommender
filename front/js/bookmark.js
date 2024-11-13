let moviesSection = document.getElementById('movies-section');
const movieData = Array(50).fill({
    imgSrc: "https://i.pinimg.com/originals/a9/2a/ff/a92aff5991e20fb22eed9a7e4b3246f0.jpg",
    name: "Avengers: End Game"
});
const itemsPerPage = 18;
const totalPages = Math.ceil(movieData.length / itemsPerPage);
let currentPage = 1;

function renderMovies(page) {
    moviesSection.innerHTML = ""; 
    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const moviesToDisplay = movieData.slice(start, end);

    moviesToDisplay.forEach(movie => {
        const movieItem = document.createElement("div");
        movieItem.classList.add("movie-item");
        movieItem.innerHTML = `
            <img src="${movie.imgSrc}" alt="${movie.name}">
            <div class="movie-name color-white">${movie.name}</div>
        `;
        moviesSection.appendChild(movieItem);
    });
}

function renderPagination() {
    pagination.innerHTML = ""; 

    const firstPageButton = document.createElement("button");
    firstPageButton.textContent = "<<";
    firstPageButton.disabled = currentPage === 1;
    firstPageButton.addEventListener("click", () => {
        currentPage = 1;
        renderMovies(currentPage);
        renderPagination();
    });
    pagination.appendChild(firstPageButton);

    const prevButton = document.createElement("button");
    prevButton.textContent = "<";
    prevButton.disabled = currentPage === 1;
    prevButton.addEventListener("click", () => {
        if (currentPage > 1) {
            currentPage--;
            renderMovies(currentPage);
            renderPagination();
        }
    });
    pagination.appendChild(prevButton);

    const pageButtonsToShow = 4;
    const startPage = Math.max(1, currentPage - Math.floor(pageButtonsToShow / 2));
    const endPage = Math.min(totalPages, startPage + pageButtonsToShow - 1);

    for (let i = startPage; i <= endPage; i++) {
        const button = document.createElement("button");
        button.textContent = i;
        button.classList.toggle("active", i === currentPage);
        button.addEventListener("click", () => {
            currentPage = i;
            renderMovies(currentPage);
            renderPagination();
        });
        pagination.appendChild(button);
    }

    const nextButton = document.createElement("button");
    nextButton.textContent = ">";
    nextButton.disabled = currentPage === totalPages;
    nextButton.addEventListener("click", () => {
        if (currentPage < totalPages) {
            currentPage++;
            renderMovies(currentPage);
            renderPagination();
        }
    });
    pagination.appendChild(nextButton);

    const lastPageButton = document.createElement("button");
    lastPageButton.textContent = ">>";
    lastPageButton.disabled = currentPage === totalPages;
    lastPageButton.addEventListener("click", () => {
        currentPage = totalPages;
        renderMovies(currentPage);
        renderPagination();
    });
    pagination.appendChild(lastPageButton);
}

renderMovies(currentPage);
renderPagination();
