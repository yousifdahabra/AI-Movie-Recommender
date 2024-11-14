let moviesPerPage = 16;
let currentPage = 1;
let moviesData = [];
const selected = JSON.parse(localStorage.getItem('selected'));
let movieImg=document.getElementById('movie-image');
movieImg.src = selected.movie_image;
document.getElementById('movie-title').innerText = selected.movie_title;
document.getElementById('movie-summary').innerText = selected.movie_summary;
document.getElementById('movie-release-date').innerText = selected.movie_release_date;

function fetchAllMovies() {
    fetch("localhost/ai-movie-recommender/back/get_movies.php")
        .then(response => response.json())
        .then(movies => {
            moviesData = movies;
            displayPage(currentPage);
            
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

fetchAllMovies();
