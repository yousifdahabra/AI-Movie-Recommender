const table_body = document.getElementById("table_body");
const disable_user_form_model = document.getElementById("disable_user_form_model");
const close_disable_form_btn = document.getElementById("close_disable_form_btn");
const submit_disable_form = document.getElementById("submit_disable_form");
const disable_id_element = document.getElementById("disable_id");
const users_ele = document.getElementById("users");
const movies = document.getElementById("movies");
const bookmarks = document.getElementById("bookmarks");





const inactive_user = async (user_id) => {
  try {
    const post_method = await axios({
      method: "post",
      url: "http://localhost/AI-Movie-Recommender/server/admin/dashboard.php",
      data: {
        update_status_users: "true",
        user_id:user_id,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    });
    console.log(post_method)
    return post_method.data;
  } catch (error) {
    return [];
  }
};
const get_users = async () => {
  try {
    const post_method = await axios({
      method: "post",
      url: "http://localhost/AI-Movie-Recommender/server/admin/dashboard.php",
      data: {
        get_users: "true",
        
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    });
    return post_method.data;
  } catch (error) {
    return [];
  }
};

const update_table = async  () =>{
    const users = await get_users() ;
    await update_table_wait(users)
}

const update_table_wait = (users) =>{
    if(users.states == 0){
      table_body.innerHTML = `<td colspan="7">No data</td>`
      return
    }
    users_ele.innerHTML = users.total_users;
    movies.innerHTML = users.total_movies;
    bookmarks.innerHTML = users.total_bookmarks;
    let body = ``;
    users.result.forEach((user, index) => {
      let status = user.is_active == 1 ? "Active":"Inactive";
      body+=`
      <tr>
          <td>${user.full_name}</td>
          <td>${user.username }</td>
          <td>0</td>
          <td>${user.is_active}</td>
          <td>${user.role}</td>
          <td>${user.create_date}</td>
          <td>
              <button data-id="${user.user_id}" class="banned-btn view ${status}"  >${status}</button>
          </td>
      </tr>
      `;
      table_body.innerHTML = body

      const banned_btns = document.querySelectorAll(".banned-btn");
      banned_btns.forEach((banned_btn) => {
        banned_btn.addEventListener("click", (event) => {
            const id = event.target.getAttribute('data-id');
            disable_user_form_model.classList.add('show')
            disable_user_form_model.classList.remove('hidden')
            document.getElementById("disable_id").value = id
          });
      });



    })
}

close_disable_form_btn.addEventListener("click",()=>{
  disable_user_form_model.classList.add('hidden')
  disable_user_form_model.classList.remove('show')
})
submit_disable_form.addEventListener("click",()=>{
  const disable_id =  disable_id_element.value
  inactive_user(disable_id);
  disable_user_form_model.classList.add('hidden')
  disable_user_form_model.classList.remove('show')
  update_table()
})

update_table()