const hamburger = document.querySelector('.hamburger');
const mobileMenu = document.querySelector('.mobile-menu');
const mobileLinks = document.querySelectorAll('.mobile-menu a');
const desktopLinks = document.querySelectorAll('.nav-links a');

hamburger.addEventListener('click', (e) => {
    e.stopPropagation();
    mobileMenu.classList.toggle('active');
});

mobileLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        mobileLinks.forEach(l => l.classList.remove('active'));
        link.classList.add('active');
        mobileMenu.classList.remove('active');
    });
});


desktopLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        desktopLinks.forEach(l => l.classList.remove('active'));
        link.classList.add('active');
    });
});

document.addEventListener('click', (e) => {
    if (!mobileMenu.contains(e.target) && !hamburger.contains(e.target)) {
        mobileMenu.classList.remove('active');
    }
});