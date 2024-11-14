let moviesPerPage = 16;
let currentPage = 1;
let moviesData = [];

function fetchAllMovies() {
    fetch("back/get_movies.php")
        .then(response => response.json())
        .then(movies => {
            moviesData = movies;
            displayPage(currentPage);
            setupPagination();
        })
        .catch(error => {
            console.error("Error fetching movies:", error);
            document.getElementById("movies-container").innerHTML = "<p>An error occurred.</p>";
        });
}

function displayPage(page) {
    const startIndex = (page - 1) * moviesPerPage;
    const endIndex = startIndex + moviesPerPage;
    const moviesToDisplay = moviesData.slice(startIndex, endIndex);
    
    const moviesContainer = document.getElementById("movies-container");
    moviesContainer.innerHTML = "";

    moviesToDisplay.forEach(movie => {
        const movieItem = document.createElement("div");
        movieItem.classList.add("movie-item");
        movieItem.innerHTML = `
            <img src="${movie.movie_image}" >
            <p class="color-white">${movie.movie_title}</p>
        `;
        movieItem.addEventListener('click',()=>{
            localStorage.setItem('selected',JSON.stringify(movie));
            window.location.href = "movie-page.html";})

        moviesContainer.appendChild(movieItem);
    });
}

function setupPagination() {
    const totalPages = Math.ceil(moviesData.length / moviesPerPage);
    const paginationControls = document.getElementById("pagination-controls");
    paginationControls.innerHTML = "";

    const prevButton = document.createElement("button");
    prevButton.innerText = "<";
    prevButton.disabled = currentPage === 1;
    prevButton.addEventListener("click", () => {
        if (currentPage > 1) {
            currentPage--;
            displayPage(currentPage);
            setupPagination();
        }
    });
    paginationControls.appendChild(prevButton);

    for (let i = 1; i <= totalPages; i++) {
        const pageButton = document.createElement("button");
        pageButton.innerText = i;
        if (i === currentPage) pageButton.disabled = true;
        pageButton.addEventListener("click", () => {
            currentPage = i;
            displayPage(currentPage);
            setupPagination();
        });
        paginationControls.appendChild(pageButton);
    }

    const nextButton = document.createElement("button");
    nextButton.innerText = ">";
    nextButton.disabled = currentPage === totalPages;
    nextButton.addEventListener("click", () => {
        if (currentPage < totalPages) {
            currentPage++;
            displayPage(currentPage);
            setupPagination();
        }
    });
    paginationControls.appendChild(nextButton);
}


fetchAllMovies();
