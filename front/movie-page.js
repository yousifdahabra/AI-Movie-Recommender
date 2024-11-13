const selected = JSON.parse(localStorage.getItem('selected'));
document.getElementById('movie-image').src = selected.movie_image;
document.getElementById('movie-title').innerText = selected.movie_title;
document.getElementById('movie-summary').innerText = selected.movie_summary;
document.getElementById('movie-release-date').innerText = selected.movie_release_date;

let addBookmark=document.getElementById('add-bookmark');
addBookmark.addEventListener('click',()=>{
    addBookmarktoDB(selected.movie_id)
})
function addBookmarktoDB(movieId){

    
    const userId = 1;
    fetch('bookmark_movie.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            user_id: userId,
            movie_id: movieId
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const button = document.querySelector(`[data-movie-id="${movieId}"] .bookmark-btn`);
            button.innerText = data.isBookmarked ? 'Remove Bookmark' : 'Bookmark';
        } else {
            alert('Error: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}