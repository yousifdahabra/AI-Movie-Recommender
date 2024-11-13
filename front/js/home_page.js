const new_movies_cards = document.getElementById("new_movies_cards");
const get_db_new_movies = async () => {
    try {
      const get_method = await axios({
        method: "get",
        url: "http://localhost/AI-Movie-Recommender/server/home_page/get_movies.php?filter_by='new'",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      });


      return get_method.data;
    } catch (error) {
      return [];
    }
};
const get_new_movies = async  () =>{
    const movies = await get_db_new_movies() ;
    await done_movies(movies)
}
const done_movies = (movies) =>{
    console.log(movies)
    let body = ``;
    movies.result.forEach((movie, index) => {

      body+=`
          <div class="movie-card flex flex-direction-column flex-wrap align-content-center">
              <div class="movies-image">
                  <img src="${movie.movie_image}" alt="">
                  <div class="movies-image-det flex flex-direction-column justify-content-center align-items-center">
                      <a href='#?id=${movie.movie_id}' class="view-details">
                          More Details
                      </a>
                  </div>
              </div>
              <div class="movie-info">
                  <h2>${movie.movie_title}</h2>
                  <p class="movie-category">${movie.movie_categories}</p>
                  <p class="movie-summary">${movie.movie_summary}</p>
              </div>
          </div>

      `;

 


    })
    new_movies_cards.innerHTML = body




}
get_new_movies();
