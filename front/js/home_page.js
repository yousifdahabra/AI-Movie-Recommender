const new_movies_cards = document.getElementById("new_movies_cards");
const trend_movies_cards = document.getElementById("trend_movies_cards");
const recommend_movies_cards = document.getElementById("recommend_movies_cards");


const get_db_movies = async (method) => {
    try {
      const get_method = await axios({
        method: "get",
        url: "http://localhost/AI-Movie-Recommender/server/home_page/get_movies.php?filter_by="+method+"",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      });


      return get_method.data;
    } catch (error) {
      return [];
    }
};
const get_movies = async  (method) =>{
    const movies = await get_db_movies(method) ;
    await done_movies(movies,method)
}
const done_movies = (movies,method) =>{
    console.log(movies)
    let body = ``;
    movies.result.forEach((movie, index) => {

      body+=`
          <div class="movie-card flex flex-direction-column flex-wrap align-content-center">
              <div class="movies-image">
                  <img src="${movie.movie_image}" alt="">
                  <div class="movies-image-det flex flex-direction-column justify-content-center align-items-center">
                      <a href='http://localhost/AI-Movie-Recommender/front/pages/movie-page.html?id=${movie.movie_id}' class="view-details">
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
    if(method == 'new')
        new_movies_cards.innerHTML = body
    if(method == 'trend')
        trend_movies_cards.innerHTML = body
    if(method == 'recommend')
        recommend_movies_cards.innerHTML = body

}
get_movies('new');
get_movies('trend');
get_movies('recommend');


const check_login = async () => {
    try {
      const get_method = await axios({
        method: "get",
        url: "http://localhost/AI-Movie-Recommender/server/authentication/check_login.php",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      });


      return get_method.data;
    } catch (error) {
      return [];
    }
};
const get_check_login = async  () =>{
    const login = await check_login() ;
    await done_login(login)
}
const done_login = async  (login) =>{
    if(login.success === true){
        const base_login = document.querySelectorAll(".base-login");
        base_login.forEach((login) => {
            // login.className.remove('base-login')
            // login.className.add('login-succ')
        });
    }else{
        
        const base_login = document.querySelectorAll(".login-succ");
        base_login.forEach((login) => {
            // login.className.add('base-login')
            // login.className.remove('login-succ')
        });

    }
}
get_check_login()