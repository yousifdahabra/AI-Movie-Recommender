axios.get('http://localhost/AI-Movie-Recommender/front/pages/yousif-header.html')
    .then(function (response) {
        document.body.insertAdjacentHTML('afterbegin', response.data);
    })
    .catch(function (error) {
        console.error('Error loading header:', error);
    });