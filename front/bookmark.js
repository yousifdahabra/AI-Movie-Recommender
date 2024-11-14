function loadBookmarks() {
    fetch(`get_bookmark.php?user_id=1`)
    .then(response => response.json())
    .then(data => {
        const bookmarksSection = document.getElementById('bookmarks-section');
        bookmarksSection.innerHTML = '';  
        

        data.bookmarks.forEach(bookmark => {
            
            const bookmarkDiv = document.createElement('div');
            bookmarkDiv.className = 'bookmark-item';
            bookmarkDiv.innerHTML = `
                <h3 class="white-color">${bookmark.movie_title}</h3>
                <img src="${bookmark.movie_image}">
            `;
            bookmarksSection.appendChild(bookmarkDiv);
        });
    })
    .catch(error => console.error('Error loading bookmarks:', error));
}

document.addEventListener('DOMContentLoaded', loadBookmarks);