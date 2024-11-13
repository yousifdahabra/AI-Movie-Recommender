function loadBookmarks() {
    fetch('/back-end/get_bookmarks.php?user_id=' + loggedInUserId)
    .then(response => response.json())
    .then(data => {
        const bookmarksSection = document.getElementById('bookmarks-section');
        bookmarksSection.innerHTML = '';  
        data.bookmarks.forEach(bookmark => {
            const bookmarkDiv = document.createElement('div');
            bookmarkDiv.className = 'bookmark-item';
            bookmarkDiv.innerHTML = `
                <h3>${bookmark.title}</h3>
                <img src="${bookmark.thumbnail}" alt="${bookmark.title}">
            `;
            bookmarksSection.appendChild(bookmarkDiv);
        });
    });
}

document.addEventListener('DOMContentLoaded', loadBookmarks);