function loadBookmarks() {
    let user = JSON.parse(localStorage.getItem('user'));
    let userId=user.user_id;
    fetch(`localhost/ai-movie-recommender/back/get_bookmark.php?user_id=${userId}`)
    .then(response => response.json())
    .then(data => {
        const bookmarksSection = document.getElementById('bookmarks-section');
        bookmarksSection.innerHTML = '';  
        

        data.bookmarks.forEach(bookmark => {
            
            const bookmarkDiv = document.createElement('div');
            bookmarkDiv.className = 'bookmark-item';
            bookmarkDiv.innerHTML = `
                
                <img src="${bookmark.movie_image}">
                <h3 class="color-white align-center">${bookmark.movie_title}</h3>
            `;
            bookmarkDiv.addEventListener('click',()=>{
                localStorage.setItem('selected',JSON.stringify(bookmark));
            window.location.href = "movie-page.html";
            })
            bookmarksSection.appendChild(bookmarkDiv);
        });
    })
    .catch(error => console.error('Error loading bookmarks:', error));
}

document.addEventListener('DOMContentLoaded', loadBookmarks);