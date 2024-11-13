const movies_cards = document.getElementById("movies_cards");
const get_users = async () => {
    try {
      const get_method = await axios({
        method: "get",
        url: "http://localhost/AI-Movie-Recommender/server/admin/dashboard.php",
        data: {
          new_movies: "1",
          
        },
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      });
      return get_method.data;
    } catch (error) {
      return [];
    }
  };
  