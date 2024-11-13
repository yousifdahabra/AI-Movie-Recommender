const selected = JSON.parse(localStorage.getItem('selected'));
document.getElementById('movie-image').src = selected.movie_image;
document.getElementById('movie-title').innerText = selected.movie_title;
document.getElementById('movie-summary').innerText = selected.movie_summary;
document.getElementById('movie-release-date').innerText = selected.movie_release_date;

